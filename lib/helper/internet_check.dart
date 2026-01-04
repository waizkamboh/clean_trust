import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isOnline() async {
  final connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    return false;
  }

  try {
    final result = await InternetAddress.lookup('example.com')
        .timeout(const Duration(seconds: 3));

    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (_) {
    return false;
  }
}
