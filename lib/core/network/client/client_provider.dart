import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/constants.dart';

@module
abstract class DioClientProvider {

  @Named('v1')
  @lazySingleton
  Dio dioClientProviderV1() {
    return Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlV1,
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 29),
        receiveTimeout: const Duration(seconds: 29),
      ),
    );
  }

  @Named('v2')
  @lazySingleton
  Dio dioClientProviderV2() {
    return Dio(
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
  }
}
