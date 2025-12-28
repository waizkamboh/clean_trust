

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/general_controller.dart';

Future DataBindings() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences,fenix: true);

  /// Initializing Controllers

  Get.lazyPut(() => GeneralController(sharedPreferences: Get.find()),fenix: true);







}