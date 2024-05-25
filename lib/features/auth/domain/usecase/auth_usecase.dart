import 'package:riverpod_sample/features/auth/data/entities/login_request.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';

import '../repo/auth_repository.dart';

class AuthUseCase {
  final AuthenticationRepository repository;

  AuthUseCase(this.repository);

  Future<LoginResponse> login(LoginRequest request) async {
    return await repository.loginUser(request);
  }
}