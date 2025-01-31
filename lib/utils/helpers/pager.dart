import 'package:flutter/material.dart';

import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/splash/splash_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
  static Widget get onboard => const OnboardPage();
}
