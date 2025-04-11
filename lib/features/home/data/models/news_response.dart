import 'package:json_annotation/json_annotation.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends BaseModel {
  final String title;
  final String content;
  final Author author;
  final String date;
  final String youtube_video_code;
  final String thumbnail;

  NewsResponse(
    this.title,
    this.content,
    this.author,
    this.date,
    this.youtube_video_code,
    this.thumbnail,
  );

  factory NewsResponse.fromJson(JsonMap json) {
    return _$NewsResponseFromJson(json);
  }

  @override
  JsonMap toJson() => _$NewsResponseToJson(this);
}

@JsonSerializable()
class Author extends BaseModel {
  final String? name;

  Author(this.name);

  factory Author.fromJson(JsonMap json) {
    return _$AuthorFromJson(json);
  }

  @override
  JsonMap toJson() => _$AuthorToJson(this);
}
