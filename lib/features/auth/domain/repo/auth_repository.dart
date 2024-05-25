
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';

import '../../data/entities/login_request.dart';

abstract class AuthenticationRepository {
  Future<LoginResponse> loginUser(LoginRequest request);
}
