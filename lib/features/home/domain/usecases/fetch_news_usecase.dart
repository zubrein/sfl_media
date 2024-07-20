import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';

import '../repositories/home_repository.dart';

@injectable
class FetchNewsUseCase {
  HomeRepository repository;

  FetchNewsUseCase({required this.repository});

  AsyncResult<List<News>> call(String categoryId) async {
    return await repository.fetchNews(categoryId);
  }
}
