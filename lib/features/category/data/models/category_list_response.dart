import 'package:json_annotation/json_annotation.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';
import 'package:sfl_media/features/category/data/models/category_response.dart';

part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse extends BaseModel {
  @JsonKey(defaultValue: [])
  final List<CategoryResponse> list;

  CategoryListResponse(this.list);

  factory CategoryListResponse.fromJson(JsonMap json) {
    return _$CategoryListResponseFromJson(json);
  }

  @override
  JsonMap toJson() => _$CategoryListResponseToJson(this);
}