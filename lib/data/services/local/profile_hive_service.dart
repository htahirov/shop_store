import 'dart:convert';
import 'dart:developer';
import 'package:hive/hive.dart';
import '../../models/remote/response/user_profile.dart';

class ProfileHiveService {
  static const String _boxName = 'userBox';
  static const String _userKey = 'userKey';

  static Future<void> saveUser(UserProfile user) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_userKey, jsonEncode(user.toMap()));
  }

  static Future<UserProfile?> getUser() async {
    final box = await Hive.openBox(_boxName);
    final data = box.get(_userKey);
    log('Saved data: $data');
    return data != null ? UserProfile.fromMap(jsonDecode(data)) : null;
  }

  static Future<void> clearAllProfiles() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
