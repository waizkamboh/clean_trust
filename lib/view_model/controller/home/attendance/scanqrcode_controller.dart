import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import '../../../../data/local_storage/hive/offline_attendance_service.dart';
import '../../../../data/model/home/attendance/ScanQRCodeModel.dart';
import '../../../../data/model/hive/offline_attendance_model.dart';
import '../../../../data/repository/home/attendance/scan_qr_code_repository.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';
import 'package:geocoding/geocoding.dart';


class ScanQrCodeController extends GetxController {
  final ScanQrCodeRepository _repo = ScanQrCodeRepository();
  final OfflineAttendanceService localDb = OfflineAttendanceService();
  final ScanQrCodeRepository repo = ScanQrCodeRepository();
  final UserPreference userPreference = UserPreference();

  late MobileScannerController scannerController;
  RxBool showScanner = false.obs;
  RxBool isScanned = false.obs;
  RxBool loading = false.obs;
  RxBool torchOn = false.obs;
  bool _scanLock = false;
  RxString scannedTime = ''.obs;
  RxString scannedDate = ''.obs;
  RxString fullAddress = ''.obs; // first 2 words





  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );


  }



  void openScanner() {
    _scanLock = false;
    isScanned.value = false;
    showScanner.value = true;

    scannerController.start();
  }



  void toggleTorch() {
    scannerController.toggleTorch();
    torchOn.value = !torchOn.value;
  }
  Future<void> onQrDetected(String qrCode) async {
    if (_scanLock) return;

    _scanLock = true;
    isScanned.value = true;
    showScanner.value = false;

    // 📷 STOP camera immediately
    await scannerController.stop();

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
      final UserPreference _userPreference = UserPreference();


      if (!online) {
        final int? userId = await userPreference.getUserId();

        if (userId == null) {
          showCustomSnackBar('User not found');
          return;
        }

        await localDb.save(
          OfflineAttendance(
            qrCode: qrCode,
            latitude: position.latitude,
            longitude: position.longitude,
            scanTime: DateTime.now().toIso8601String(),
            userId: userId,
          ),
        );


        localDb.debugPrintAll();

        loading.value = false;
        Get.back();
        showCustomSnackBar('Attendance saved offline');
        return;
      }

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
        setScanTimeAndDate();

        await setAddressFromLatLng(
          position.latitude,
          position.longitude,
        );

        Get.offNamed(RouteName.scanResultScreen);

        showCustomSnackBar('Attendance marked successfully');
      } else {
        showCustomSnackBar(response?['message'] ?? 'Failed');
      }
    } catch (e) {
      loading.value = false;
      showCustomSnackBar('Something went wrong');
    }
  }


  void setScanTimeAndDate() {
    final now = DateTime.now();

    scannedTime.value = DateFormat('hh:mm a').format(now);
    scannedDate.value = DateFormat('EEEE, MMM d, yyyy').format(now);
  }
  Future<void> setAddressFromLatLng(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        // Update the controller's observable
        fullAddress.value = '${place.street}, ${place.locality}, ${place.country}';

        debugPrint('FULL ADDRESS: ${fullAddress.value}');
      }
    } catch (e) {
      debugPrint('GEOCODING ERROR: $e');
    }
  }





  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
  }

