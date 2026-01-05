import 'package:clean_trust/helper/get_di.dart';
import 'package:clean_trust/util/language_module/utils/localization_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: OnboardingScreen3(),
      locale: LocalizationService.locale ,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}


