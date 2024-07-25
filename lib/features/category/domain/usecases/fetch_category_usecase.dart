import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/category/domain/entities/category.dart';
import 'package:sfl_media/features/category/domain/repositories/category_repository.dart';

@injectable
class FetchCategoryUseCase {
  CategoryRepository repository;

  FetchCategoryUseCase({required this.repository});

  AsyncResult<List<Category>> call(String categoryId) async {
    return await repository.fetchCategories();
  }
}
