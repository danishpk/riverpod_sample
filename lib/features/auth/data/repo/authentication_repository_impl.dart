
import 'package:riverpod_sample/features/auth/data/entities/login_request.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';

import '../../domain/repo/auth_repository.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<LoginResponse> loginUser(LoginRequest request) {
    return dataSource.loginUser(request);
  }

}
