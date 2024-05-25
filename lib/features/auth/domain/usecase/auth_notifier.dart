import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_request.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';
import 'package:riverpod_sample/features/auth/domain/usecase/auth_usecase.dart';

class LoginNotifier extends StateNotifier<AsyncValue<LoginResponse?>> {
  final AuthUseCase authUseCase;

  LoginNotifier(this.authUseCase) : super(const AsyncValue.data(null));

  Future<void> loginUser(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final loginResponse = await authUseCase.login(LoginRequest(email: email, password: password));
      state = AsyncValue.data(loginResponse);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.empty);
    }
  }
}