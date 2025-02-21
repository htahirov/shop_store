import 'package:shop_store/data/models/remote/request/signup_request.dart';
import '../models/remote/response/user_profile.dart';
import '../repo/signup_repo.dart';
import '../services/remote/signup_service.dart';

class SignUpRepoImpl implements SignUpRepo {
  SignUpRepoImpl(this._signUpService);

  final SignUpService _signUpService;

  @override
  Future<UserProfile?> signUp({required SignUpRequest request}) {
    return _signUpService.signUp(request);
  }
}
