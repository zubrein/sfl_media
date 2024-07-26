import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/data/api/news_api.dart';
import 'package:sfl_media/features/home/data/models/news_model.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';
import 'package:sfl_media/features/home/domain/repositories/home_repository.dart';
import 'package:sfl_media/utils/author_list.dart';
import 'package:sfl_media/utils/formatter.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final NewsApi newsApi;

  HomeRepositoryImpl(this.newsApi);

  @override
  AsyncResult<List<News>> fetchNews({
    required int page,
    String categoryId = '',
  }) async {
    List<News> newsList = [];
    Map<String, dynamic> query = {};
    query.addAll({'page': page});
    if (categoryId.isNotEmpty) {
      query.addAll({'categories': categoryId});
    }
    final response = await newsApi.get(
      parameters: query,
    );

    return response.fold((result) {
      for (var news in result.list) {
        final newsData = NewsModel.processData(news.content.rendered ?? '');

        newsList.add(
          News(
            title: news.title.rendered ?? '',
            subTitle: newsData.subTitle,
            description: newsData.description,
            thumbnailImage: news.jetpack_featured_media_url,
            author: authors[news.author] ?? '',
            date: formattedDate(news.date),
            videoUrl: newsData.videoUrl,
          ),
        );
      }

      return Left(newsList);
    }, (error) {
      return Right(error);
    });
  }
}
