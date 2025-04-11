import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/logger.dart';
import 'package:sfl_media/core/network/constants/constants.dart';

@module
abstract class DioClientProvider {
  @Named('v2')
  @lazySingleton
  Dio dioClientProviderV2() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlV2,
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 29),
        receiveTimeout: const Duration(seconds: 29),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      logPrint: (message) => Log.info(message.toString()), // or use your custom logger
    ));

    return dio;
  }
}
