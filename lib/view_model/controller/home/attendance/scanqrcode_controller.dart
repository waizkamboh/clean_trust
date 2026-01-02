import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import '../../../../data/local_storage/hive/offline_attendance_service.dart';
import '../../../../data/model/home/attendance/ScanQRCodeModel.dart';
import '../../../../data/model/hive/offline_attendance.dart';
import '../../../../data/repository/home/attendance/scan_qr_code_repository.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../../view/screens/home/scan_qrcode_screen.dart';
import '../../../user_preference/user_preference.dart';


class ScanQrCodeController extends GetxController {
  final ScanQrCodeRepository _repo = ScanQrCodeRepository();
  final UserPreference _userPreference = UserPreference();
  final OfflineAttendanceService localDb = OfflineAttendanceService();
  final ScanQrCodeRepository repo = ScanQrCodeRepository();
  final UserPreference userPreference = UserPreference();

  late MobileScannerController scannerController;
  RxBool showScanner = false.obs;
  RxBool isScanned = false.obs;
  RxBool loading = false.obs;
  RxBool torchOn = false.obs;



  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );

    // try syncing when controller starts
    sync();
  }

  Future<bool> shouldAskForLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    // Ask only if location is not ready
    if (!serviceEnabled || permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return true;
    }
    return false; // everything is OK
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showCustomSnackBar('Please enable location to continue.');
      await Geolocator.openLocationSettings();
      throw Exception('Location service disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      showCustomSnackBar(
        'Location permission is required for attendance. Enable it from settings.',
      );
      await Geolocator.openAppSettings();
      throw Exception('Permission denied forever');
    }
    if (permission == LocationPermission.denied) {
      throw Exception('Permission denied');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // Close dialog before navigation
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    Get.toNamed(RouteName.scanQRCodeScreen);
    return position;
  }

  void openScanner() {
    isScanned.value = false;
    showScanner.value = true;
  }

  void toggleTorch() {
    scannerController.toggleTorch();
    torchOn.value = !torchOn.value;
  }

  Future<void> onQrDetected(String qrCode) async {
    if (isScanned.value) return;
    isScanned.value = true;
    showScanner.value = false;
    await _markAttendance(qrCode);
  }



  Future<void> _markAttendance(String qrCode) async {
    try {
      loading.value = true;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final online = await isOnline();
      debugPrint('INTERNET STATUS: $online');


      /// ================= OFFLINE =================
      if (!online) {
        await localDb.save(
          OfflineAttendance(
            qrCode: qrCode,
            latitude: position.latitude,
            longitude: position.longitude,
            scanTime: DateTime.now().toIso8601String(),
          ),
        );
        localDb.debugPrintAll();

        loading.value = false;
        showCustomSnackBar('Attendance saved offline');
        return;
      }

      /// ================= ONLINE =================
      final token = await _userPreference.getToken();

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final data = {
        "qr_code": qrCode,
        "latitude": position.latitude,
        "longitude": position.longitude,
        "is_offline": false,
      };

      final response = await _repo.scanQRCodeApi(headers, data);

      loading.value = false;

      if (response?['success'] == true) {
        showCustomSnackBar('Attendance marked successfully');
      } else {
        showCustomSnackBar(response?['message'] ?? 'Failed');
      }
    } catch (e) {
      loading.value = false;
      showCustomSnackBar('Something went wrong');
    }
  }

  Future<void> sync() async {
    if (!await isOnline()) return;

    final token = await userPreference.getToken();
    if (token == null) return;

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final list = localDb.getUnSynced();

    for (final item in list) {
      final data = {
        "qr_code": item.qrCode,
        "latitude": item.latitude,
        "longitude": item.longitude,
        "is_offline": true,
      };

      final res = await repo.scanQRCodeApi(headers, data);

      if (res != null && res['success'] == true) {
        item.synced = true;
        await item.save();
      }
    }
  }


  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
  }


// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter/foundation.dart';
//
// import '../../../../data/model/home/attendance/ScanQRCodeModel.dart';
// import '../../../../data/repository/home/attendance/scan_qr_code_repository.dart';
// import '../../../../util/custom_snackbar.dart';
// import '../../../user_preference/user_preference.dart';
// import '../../../helper/routes/routes_name.dart';
//
// class ScanQrCodeController extends GetxController {
//   final ScanQrCodeRepository _repo = ScanQrCodeRepository();
//   final UserPreference _userPreference = UserPreference();
//
//   Future<bool> shouldAskForLocationPermission() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     LocationPermission permission = await Geolocator.checkPermission();
//     // Ask only if location is not ready
//     if (!serviceEnabled || permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       return true;
//     }
//     return false; // everything is OK
//   }
//
//   Future<Position> getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       showCustomSnackBar('Please enable location to continue.');
//       await Geolocator.openLocationSettings();
//       throw Exception('Location service disabled');
//     }
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     if (permission == LocationPermission.deniedForever) {
//       showCustomSnackBar(
//         'Location permission is required for attendance. Enable it from settings.',
//       );
//       await Geolocator.openAppSettings();
//       throw Exception('Permission denied forever');
//     }
//     if (permission == LocationPermission.denied) {
//       throw Exception('Permission denied');
//     }
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     // Close dialog before navigation
//     if (Get.isDialogOpen == true) {
//       Get.back();
//     }
//     Get.toNamed(RouteName.scanQRCodeScreen);
//     return position;
//   }
//
//
//   @override
//   void onInit() {
//     super.onInit();
//
//   }
//
//
//
//   Future<void> _sendAttendance(String qrCode) async {
//     try {
//       loading.value = true;
//       final token = await _userPreference.getToken();
//       if (token == null || token.isEmpty) {
//         showCustomSnackBar('Authentication required');
//         return;
//       }
//
//       final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       final headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       };
//
//       final data = {
//         "qr_code": qrCode,
//         "latitude": position.latitude,
//         "longitude": position.longitude,
//         "is_offline": false,
//       };
//
//       final response = await _repo.scanQRCodeApi(headers, data);
//       loading.value = false;
//
//       if (response == null) {
//         showCustomSnackBar('No response from server');
//         return;
//       }
//
//       final result = ScanQRCodeModel.fromJson(response);
//
//       if (result.success != true) {
//         showCustomSnackBar(result.message ?? 'Attendance failed');
//         return;
//       }
//
//       if (result.data?.isValid == false) {
//         showCustomSnackBar(
//           result.data?.attendance?.validationMessage ?? 'You are outside allowed area',
//         );
//         return;
//       }
//
//       showCustomSnackBar(
//         result.message ?? 'Attendance marked successfully',
//       );
//     } catch (e, s) {
//       loading.value = false;
//       showCustomSnackBar('Something went wrong');
//       if (kDebugMode) {
//         print(e);
//         print(s);
//       }
//     }
//   }
//
//   @override
//   void onClose() {
//     scannerController.dispose();
//     super.onClose();
//   }
// }
//
//
//
//
//
