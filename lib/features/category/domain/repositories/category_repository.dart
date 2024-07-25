import 'package:sfl_media/core/network/constants/typedefs.dart';

import '../entities/category.dart';

abstract class CategoryRepository {
  AsyncResult<List<Category>> fetchCategories();
}
