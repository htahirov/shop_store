import 'dart:convert';
import 'package:hive/hive.dart';
import '../../models/remote/response/user_profile.dart';

class ProfileHiveService {
  static const String _boxName = 'userBox';

  static Future<void> saveUser(UserProfile user) async {
    final box = await Hive.openBox<Map<String, dynamic>>(_boxName);
    await box.put(user.email, user.toMap());
    print("✅ [saveUser] User profile saved: ${jsonEncode(user.toMap())}");
  }

  static Future<UserProfile?> getUser(String email) async {
    final box = await Hive.openBox<Map<String, dynamic>>(_boxName);
    final data = box.get(email);
    print('Saved data: $data');
    return data != null ? UserProfile.fromMap(Map<String, dynamic>.from(data)) : null;
  }

  static Future<void> updateUser(UserProfile user) async {
    final box = await Hive.openBox<Map<String, dynamic>>(_boxName);
    await box.put(user.email, user.toMap());
    print("✅ [updateUser] User profile updated: ${jsonEncode(user.toMap())}");
  }

  static Future<void> clearAllProfiles() async {
    final box = await Hive.openBox<Map<String, dynamic>>(_boxName);
    await box.clear();
    print("✅ [clearAllProfiles] Cleared all profiles.");
  }
}
