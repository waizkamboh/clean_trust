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
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;



  @override
  void onInit() {
    super.onInit();
    fetchCurrentLocation();
    scannerController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );

  }



  // void openScanner() {
  //   _scanLock = false;
  //   isScanned.value = false;
  //   showScanner.value = true;
  // }


  void openScanner() async {
    _scanLock = false;
    showScanner.value = true;

    await scannerController.start();
  }



  void toggleTorch() {
    scannerController.toggleTorch();
    torchOn.value = !torchOn.value;
  }

  Future<void> onQrDetected(String qrCode) async {
    if (_scanLock) return;

    _scanLock = true;
    await scannerController.stop();

    showScanner.value = false;

    await _markAttendance(qrCode);
  }





  Future<void> fetchCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      await setAddressFromLatLng(
        latitude.value,
        longitude.value,
      );
      debugPrint('latitude: ${latitude.value}');
      debugPrint('longitude: ${longitude.value}');

    } catch (e) {
      debugPrint('LOCATION ERROR: $e');
    }
  }


  Future<void> _markAttendance(String qrCode) async {
    try {
      loading.value = true;

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
            latitude: latitude.value,
            longitude: longitude.value,
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
        "latitude": latitude.value,
        "longitude": longitude.value,
        "is_offline": false,
      };

      final response = await _repo.scanQRCodeApi(headers, data);

      loading.value = false;

      if (response?['success'] == true) {
        setScanTimeAndDate();

        await setAddressFromLatLng(
          latitude.value,
          longitude.value,
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
    scannerController.stop();
    scannerController.dispose();
    super.onClose();
  }

}

