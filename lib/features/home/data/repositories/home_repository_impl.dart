import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sfl_media/core/logger.dart';
import 'package:sfl_media/core/network/constants/constants.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/data/api/news_api.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';
import 'package:sfl_media/features/home/domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final NewsApi newsApi;

  HomeRepositoryImpl(this.newsApi);

  @override
  AsyncResult<List<News>> fetchNews(String categoryId) async {
    List<News> newsList = [];
    final response = await newsApi.get(parameters: {'categories=': categoryId});
    const image =
        'https://sfl.media/wp-content/uploads/2024/07/2024-european-championships-round-of-16-3592df36-7075-46b7-aeae-77901ec71c19.jpeg';
    return response.fold((result) {
      for (var news in result.list) {
        Log.info(extractYouTubeUrl(news.content.rendered ?? '') ?? '');
        newsList.add(
          News(
              title: news.title.rendered ?? '',
              description: Bidi.stripHtmlIfNeeded(news.content.rendered ?? ''),
              thumbnailImage: image,
              author: news.author.toString(),
              date: news.date,
              videoUrl: extractYouTubeUrl(news.content.rendered ?? '')),
        );
      }

      return Left(newsList);
    }, (r) {
      return const Right(defaultFailureMessage);
    });
  }

  String? extractYouTubeUrl(String htmlContent) {
    RegExp regex = RegExp(r'<iframe.*?src=["\"](.*?)["\"]');

    Match? match = regex.firstMatch(htmlContent);

    if (match != null) {
      String? url = match.group(1);

      if (url != null) {
        if (url.contains('youtube.com') || url.contains('youtu.be')) {
          return url;
        }
      }
    }

    return null;
  }
}
