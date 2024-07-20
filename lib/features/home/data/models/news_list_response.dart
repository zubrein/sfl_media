import 'package:json_annotation/json_annotation.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';

import 'news_response.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse extends BaseModel {
  @JsonKey(defaultValue: [])
  final List<NewsResponse> list;

  NewsListResponse(this.list);

  factory NewsListResponse.fromJson(JsonMap json) {
    return _$NewsListResponseFromJson(json);
  }

  @override
  JsonMap toJson() => _$NewsListResponseToJson(this);
}
