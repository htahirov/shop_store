import 'package:flutter/material.dart';
import 'package:shop_store/ui/pages/verify_page/verify_page.dart';

import '../../ui/pages/splash/splash_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
  static Widget get verify =>  const VerifyPage();
}
