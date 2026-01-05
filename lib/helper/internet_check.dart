import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

Future<bool> isOnline() async {
  final result = await Connectivity().checkConnectivity();

  return result != ConnectivityResult.none;
  debugPrint('Connectivity: $result');

}
