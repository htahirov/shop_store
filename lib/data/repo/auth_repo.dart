import '../models/remote/request/login_request.dart';
import '../models/remote/request/signup_request.dart';
import '../models/remote/response/login_response.dart';
import '../models/remote/response/user_profile.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login({
    required LoginRequest request,
  });
   Future<UserProfile?> signUp({
  required SignUpRequest request,
  });
}
