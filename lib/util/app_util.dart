import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../helper/routes/routes_name.dart';
import 'custom_snackbar.dart';

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
    showCustomSnackBar('locationRequiredDialog1'.tr);
    await Geolocator.openLocationSettings();
    throw Exception('Location service disabled');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    showCustomSnackBar(
      'locationRequiredDialog2'.tr,
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
