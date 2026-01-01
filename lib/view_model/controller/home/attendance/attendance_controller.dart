import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/model/home/attendance/ScanQRCodeModel.dart';
import '../../../../data/repository/home/attendance/scan_qr_code_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';


class ScanQrCodeController extends GetxController {

  final ScanQrCodeRepository _repo = ScanQrCodeRepository();
  final UserPreference _userPreference = UserPreference();

  MobileScannerController scannerController = MobileScannerController();

  RxBool showScanner = false.obs;
  RxBool isScanned = false.obs;
  RxBool loading = false.obs;

  ///  QR image tap
  void openScanner() {
    isScanned.value = false;
    showScanner.value = true;
  }

  ///  QR detected
  Future<void> onQrDetected(String qrCode) async {
    if (isScanned.value) return;

    isScanned.value = true;
    showScanner.value = false;

    await _sendAttendance(qrCode);
  }

  /// ================= API CALL WITH TOKEN =================
  Future<void> _sendAttendance(String qrCode) async {
    try {
      loading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) {
        showCustomSnackBar('Authentication required');
        return;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };


      final Map<String, dynamic> data = {
        "qr_code": qrCode,
        "latitude": position.latitude,
        "longitude": position.longitude,
        "is_offline": false,
      };

      final response = await _repo.scanQRCodeApi(headers, data);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      final ScanQRCodeModel result =
      ScanQRCodeModel.fromJson(response);

      if (result.success != true) {
        showCustomSnackBar(result.message ?? 'Attendance failed');
        return;
      }

      if (result.data?.isValid == false) {
        showCustomSnackBar('You are outside allowed area',);
        return;
      }

      showCustomSnackBar(
        result.message ?? 'Attendance marked successfully',
      );

    } catch (e, s) {
      loading.value = false;
      showCustomSnackBar('Something went wrong');
      if (kDebugMode) {
        print('SCAN QR ERROR: $e');
        print(s);
      }
    }
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
