import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/constants.dart';

@module
abstract class DioClientProvider {
  @injectable
  Dio dioClientProvider() {
    return Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
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
