import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:shop_store/data/models/local/address_model.dart';


class AddressHiveService {
  static const String boxName = 'addressBox';
  static const String keyName = 'adress';

  static Future<void> saveData(AddressModel adress) async {
    final box = await Hive.openBox<String>(boxName);
    List<AddressModel> adresss = await getData() ?? [];
    
    adresss.add(adress);
    final encodedData = jsonEncode(adresss.map((e) => e.toJson()).toList());
    await box.put(keyName, encodedData);
    log("Address yadda saxlanıldı: $encodedData");
  }

  static Future<List<AddressModel>?> getData() async {
    final box = await Hive.openBox<String>(boxName);
    final data = box.get(keyName);
    if (data == null) return null;

    final List<dynamic> result = jsonDecode(data);
    return result.map((e) => AddressModel.fromJson(e)).toList();
  }

  static Future<void> deleteData(int index) async {
    final box = await Hive.openBox<String>(boxName);
    List<AddressModel> adresss = await getData() ?? [];
    
    if (index < adresss.length) {
      adresss.removeAt(index);
      final encodedData = jsonEncode(adresss.map((e) => e.toJson()).toList());
      await box.put(keyName, encodedData);
      log("Adress silindi: index $index");
    }
  }
}
