import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../helper/routes/routes_name.dart';
import 'app_colors.dart';
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

  Get.toNamed(RouteName.scanQRCodeScreen);
  return position;
}



Future<void> datePicker(    {
  required TextEditingController controller,
}
    ) async {
  DateTime? _picked = await showDatePicker(
    context: Get.context!,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          // Change the color of the selected date circle
          colorScheme: ColorScheme.light(primary: AppColors.kSkyBlueColor), // Change the color as per your preference
          // Change the text color of the selected date

        ),
        child: child!,
      );
    },
  );
  if (_picked != null) {
    controller.text = _picked.toString().split(" ")[0];
  }
}
