import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

RxBool isOnlineRx = false.obs;

Future<bool> isOnline() async {
  final result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}

class InternetStatusService {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  void startListening() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      isOnlineRx.value = results.isNotEmpty &&
          !results.contains(ConnectivityResult.none);
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
