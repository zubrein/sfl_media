import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/features/category/data/api/category_api.dart';
import 'package:sfl_media/features/category/domain/entities/category.dart';
import 'package:sfl_media/features/category/domain/repositories/category_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {
  CategoryApi categoryApi;

  CategoryRepositoryImpl(this.categoryApi);

  @override
  AsyncResult<List<Category>> fetchCategories() async {
    List<Category> categoryList = [];
    final response = await categoryApi.get();

    return response.fold((result) {
      for (var category in result.list) {
        categoryList.add(Category(category.id.toString(), category.name));
      }
      return Left(categoryList);
    }, (error) => Right(error));
  }
}
