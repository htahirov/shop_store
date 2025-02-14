import 'package:flutter/material.dart';

class AppRadiuses {
  AppRadiuses._();

  static const a10 = BorderRadius.all(Radius.circular(10));
  static const a16 = BorderRadius.all(Radius.circular(16));
  static const a6 = BorderRadius.all(Radius.circular(6));
  static final c50 = BorderRadius.circular(50);
  static final c20 = BorderRadius.circular(20);
  static const a50 = BorderRadius.all(Radius.circular(50));
  static const aR16 = RoundedRectangleBorder(borderRadius: AppRadiuses.a16);
}
