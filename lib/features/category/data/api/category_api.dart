import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/apis/base_api.dart';
import 'package:sfl_media/core/network/constants/constants.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';

import '../models/category_list_response.dart';

@injectable
class CategoryApi extends BaseApi<CategoryListResponse> {
  CategoryApi(
    @Named('v1') Dio dio,
  ) : super(Constants.categoriesUrl, dio);

  @override
  CategoryListResponse mapResponse(JsonMap responseJson) =>
      CategoryListResponse.fromJson(responseJson);
}
