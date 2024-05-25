

import 'dart:convert';

import 'package:riverpod_sample/config/network_config.dart';
import 'package:riverpod_sample/features/auth/data/entities/login_response.dart';

import '../entities/login_request.dart';

abstract class LoginUserDataSource {
  Future<LoginResponse> loginUser(LoginRequest request);
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final RemoteNetworkConfig networkService;

  LoginUserRemoteDataSource(this.networkService);
  @override
  Future<LoginResponse> loginUser(LoginRequest request) async {
    var response = await networkService
        .dio
        .post("/login", data: jsonEncode(request.toJson()));
    return LoginResponse.fromJson(response.data);
  }

}
