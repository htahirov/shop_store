import 'package:hive/hive.dart';
import '../../models/remote/response/user_profile.dart';

class ProfileHiveService {
  static const String _boxName = 'userBox';
  static Box<Map<String, dynamic>>? _profileBox;

  static Future<void> _openBox() async {
    if (_profileBox == null) {
      _profileBox = await Hive.openBox<Map<String, dynamic>>(_boxName);
    }
  }

  static Future<void> saveUser(UserProfile user) async {
    await _openBox();  
    await _profileBox!.put(user.email, user.toMap());
  }

  static Future<UserProfile?> getUser(String email) async {
    await _openBox();  
    final data = _profileBox!.get(email);
    return data != null ? UserProfile.fromMap(Map<String, dynamic>.from(data)) : null;
  }

  static Future<void> updateUser(UserProfile user) async {
    await _openBox(); 
    await _profileBox!.put(user.email, user.toMap());
  }
}
