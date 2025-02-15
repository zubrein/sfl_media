
import 'package:json_annotation/json_annotation.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends BaseModel{
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: 0)
  final int count;

  CategoryResponse(this.id, this.name, this.count);

  factory CategoryResponse.fromJson(JsonMap json) {
    return _$CategoryResponseFromJson(json);
  }

  @override
  JsonMap toJson() => _$CategoryResponseToJson(this);
}