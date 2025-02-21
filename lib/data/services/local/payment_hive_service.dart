import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';

import '../../models/local/payment_card_model.dart';

class PaymentHiveService {
  static const String boxName = 'paymentBox';
  static const String keyName = 'paymentCards';

  static Future<void> saveData(PaymentCardModel card) async {
    final box = await Hive.openBox<String>(boxName);
    List<PaymentCardModel> cards = await getData() ?? [];
    
    cards.add(card);
    final encodedData = jsonEncode(cards.map((e) => e.toJson()).toList());
    await box.put(keyName, encodedData);
    log("Kart yadda saxlanıldı: $encodedData");
  }

  static Future<List<PaymentCardModel>?> getData() async {
    final box = await Hive.openBox<String>(boxName);
    final data = box.get(keyName);
    if (data == null) return null;

    final List<dynamic> result = jsonDecode(data);
    return result.map((e) => PaymentCardModel.fromJson(e)).toList();
  }

  static Future<void> deleteData(int index) async {
    final box = await Hive.openBox<String>(boxName);
    List<PaymentCardModel> cards = await getData() ?? [];
    
    if (index < cards.length) {
      cards.removeAt(index);
      final encodedData = jsonEncode(cards.map((e) => e.toJson()).toList());
      await box.put(keyName, encodedData);
      log("Kart silindi: index $index");
    }
  }
}
