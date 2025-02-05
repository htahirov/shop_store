import '../models/remote/request/login_request.dart';
import '../models/remote/response/login_response.dart';
import '../repo/auth_repo.dart';
import '../services/auth_service.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._authService);

  final AuthService _authService;

  @override
  Future<LoginResponse?> login({
    required LoginRequest request,
  }) =>
      _authService.login(request: request);
}
