import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';

abstract class HomeRepository {
  AsyncResult<List<News>> fetchNews(String categoryId);
}
