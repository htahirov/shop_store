import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class InternetCheckerManager {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> hasInternetConnection() async {
    final result = await _connectivity.checkConnectivity();
    final isOffline = result.contains(ConnectivityResult.none);

    if (isOffline) return false;

    // For WiFi or mobile connection, we need to verify if there's actual internet access
    // Sometimes, you're connected to a network but there's no internet access
    return await _checkInternetAccess();
  }

  static Future<bool> _checkInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      log('message google');
      final hasInternet = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      log('message google: $hasInternet');
      return hasInternet;
    } on SocketException catch (_) {
      return false;
    }
  }
}
