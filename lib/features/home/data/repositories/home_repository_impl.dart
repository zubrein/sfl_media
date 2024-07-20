import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sfl_media/core/network/constants/constants.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/data/api/news_api.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';
import 'package:sfl_media/features/home/domain/repositories/home_repository.dart';
import 'package:sfl_media/dummy_data.dart' as d;

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final NewsApi newsApi;

  HomeRepositoryImpl(this.newsApi);

  @override
  AsyncResult<List<News>> fetchNews(String categoryId) async {
    List<News> newsList = [];
    final response = await newsApi.get(parameters: {'categories=': categoryId});

    return response.fold((result) {
      for (var news in result.newsList) {
        newsList.add(
          News(
            title: news.title.rendered ?? '',
            description: Bidi.stripHtmlIfNeeded(news.content.rendered ?? ''),
            thumbnailImage: d.newsList[0].thumbnailImage,
            author: 'Patrick',
            date: news.date,
          ),
        );
      }

      return Left(newsList);
    }, (r) {
      return const Right(defaultFailureMessage);
    });
  }
}
