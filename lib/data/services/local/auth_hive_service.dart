import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_store/locator.dart';
import 'package:shop_store/utils/helpers/go.dart';
import 'package:shop_store/utils/helpers/pager.dart';

import '../../models/remote/response/login_response.dart';

class AuthHiveService {
  static Future<void> saveData(LoginResponse response) async {
    final box = await Hive.openBox<String>('authBox');
    final data = response.toJson();
    final encodedData = jsonEncode(data);
    await box.put('authKey', encodedData);
      log("✅ [saveData] Token saxlandı: $encodedData"); // 🛠 Debug log
  }

  static Future<LoginResponse?> getData() async {
    final box = await Hive.openBox<String>('authBox');
    final data = box.get('authKey');
    log('Saved data: $data');
    if (data == null) return null;
    final result = jsonDecode(data);
    return LoginResponse.fromJson(result);
  }

  static void logout() async {
    final box = await Hive.openBox<String>('authBox');
    await box.clear();
    Go.replace(appContext, Pager.signIn);
  }
}
