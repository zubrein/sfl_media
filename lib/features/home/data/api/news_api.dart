import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/apis/base_api.dart';
import 'package:sfl_media/core/network/constants/constants.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/data/models/news_list_response.dart';

@injectable
class NewsApi extends BaseApi<NewsListResponse> {
  NewsApi(Dio dio) : super(Constants.newsUrl, dio);

  @override
  NewsListResponse mapResponse(JsonMap responseJson) =>
      NewsListResponse.fromJson(responseJson);
}
