import 'package:shop_store/data/models/remote/request/signup_request.dart';
import 'package:shop_store/data/models/remote/response/user_profile.dart';


abstract class SignUpRepo {
  Future<UserProfile?> signUp({
  required SignUpRequest request,
  });
}



