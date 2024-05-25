// Define the repository provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/config/network_config.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';
import 'package:riverpod_sample/features/auth/data/repo/authentication_repository_impl.dart';
import 'package:riverpod_sample/features/auth/domain/usecase/auth_usecase.dart';

import '../../data/datasource/auth_remote_data_source.dart';
import '../../domain/usecase/auth_notifier.dart';

final authRepositoryProvider = Provider<AuthenticationRepositoryImpl>((ref) {
  return AuthenticationRepositoryImpl(LoginUserRemoteDataSource(RemoteNetworkConfig()));
});

final loginProvider = Provider<AuthUseCase>((ref) {
  return AuthUseCase(ref.watch(authRepositoryProvider));
});

final userProvider = StateNotifierProvider.autoDispose<LoginNotifier, AsyncValue<LoginResponse?>>((ref) {
  return LoginNotifier(ref.watch(loginProvider));
});