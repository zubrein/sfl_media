import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfl_media/core/logger.dart';
import 'package:sfl_media/core/network/constants/constants.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';

abstract class BaseApi<TRes extends BaseModel> {
  final String endpoint;
  final Dio client;

  const BaseApi(this.endpoint, this.client);

  AsyncResult<TRes> get({JsonMap? parameters}) async {
    try {
      final Response response = await client.get(
        endpoint,
        queryParameters: parameters,
      );
      if (response.data is List) {
        response.data = {'list': response.data};
      }
      return Left(mapResponse(response.data));
    } on DioException catch (error, stackTrace) {
      Log.error(defaultFailureMessage, error, stackTrace);
      return Right(mapDioErrorToFailure(error, stackTrace));
    } catch (error, stackTrace) {
      Log.error(defaultFailureMessage, error, stackTrace);
      return const Right(defaultFailureMessage);
    }
  }

  @protected
  TRes mapResponse(JsonMap responseJson);

  String mapDioErrorToFailure(DioException error, StackTrace stackTrace) {
    if (error.type == DioExceptionType.badResponse) {
      return defaultFailureMessage;
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.unknown) {
      return networkFailureMessage;
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout';
    } else {
      return defaultFailureMessage;
    }
  }
}
