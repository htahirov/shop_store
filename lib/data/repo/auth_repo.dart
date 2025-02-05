import '../models/remote/request/login_request.dart';
import '../models/remote/response/login_response.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login({
    required LoginRequest request,
  });
}
