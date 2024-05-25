import 'package:dio/dio.dart';
import 'package:riverpod_sample/config/env_config.dart';

class RemoteNetworkConfig {
  final dio = createDio();

  RemoteNetworkConfig._internal();

  static final _singleton = RemoteNetworkConfig._internal();

  factory RemoteNetworkConfig() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: EnvInfo.connectionString,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ));
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true));
    return dio;
  }
}