import 'package:shop_store/data/models/remote/response/user_profile.dart';

import '../models/remote/request/login_request.dart';
import '../models/remote/request/signup_request.dart';
import '../models/remote/response/login_response.dart';
import '../repo/auth_repo.dart';
import '../services/remote/auth_service.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._authService, this._signUpService);
final AuthService _signUpService;
  final AuthService _authService;

  @override
  Future<LoginResponse?> login({
    required LoginRequest request,
  }) =>
      _authService.login(request: request);

      

  @override
  Future<UserProfile?> signUp({required SignUpRequest request}) {
    return _signUpService.signUp(request);
  }
}
