import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter/widgets.dart';

import '../../app_setting/get_app_setting_controller.dart';


class ScanQrCodeController extends GetxController with WidgetsBindingObserver{
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
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString workplaceName = ''.obs;
  RxString workplaceAddress = ''.obs;




  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    scannerController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 🔥 App wapas aayi hai (Settings se)
      fetchCurrentLocation();
    }
  }


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
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission =
      await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      debugPrint('Latitude: ${latitude.value}');
      debugPrint('Longitude: ${longitude.value}');
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
        final appSettingController = Get.find<AppSettingController>();

        /// 🔹 Auto Sync OFF
        if (!appSettingController.autoSync.value) {
          loading.value = false;

          showCustomSnackBar(
            'Auto sync is turned off. Please enable it from settings to save attendance offline.',
          );

          return;
        }

        /// 🔹 Auto Sync ON → save locally
        final int? userId = await userPreference.getUserId();

        if (userId == null) {
          loading.value = false;
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

        showCustomSnackBar(
          'No internet. Attendance saved offline and will sync automatically.',
        );

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
        final workplace = response['data']?['workplace'];

        if (workplace != null) {
          workplaceName.value = workplace['name'] ?? '';
          workplaceAddress.value = workplace['address'] ?? '';
        }
        debugPrint('WORKPLACE NAME: ${workplaceName.value}');
        debugPrint('WORKPLACE ADDRESS: ${workplaceAddress.value}');

        setScanTimeAndDate();



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




  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    scannerController.stop();

    scannerController.dispose();
    super.onClose();
  }


}

