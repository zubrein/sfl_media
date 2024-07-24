import 'package:json_annotation/json_annotation.dart';
import 'package:sfl_media/core/network/constants/typedefs.dart';
import 'package:sfl_media/core/network/models/base_model.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends BaseModel {
  final int id;
  final int author;
  final String date;
  final Title title;
  final String jetpack_featured_media_url;
  final Content content;
  final String link;

  NewsResponse(
    this.id,
    this.date,
    this.link,
    this.title,
    this.author,
    this.content, this.jetpack_featured_media_url,
  );

  factory NewsResponse.fromJson(JsonMap json) {
    return _$NewsResponseFromJson(json);
  }

  @override
  JsonMap toJson() => _$NewsResponseToJson(this);
}

@JsonSerializable()
class Title extends BaseModel {
  final String? rendered;

  Title(this.rendered);

  factory Title.fromJson(JsonMap json) {
    return _$TitleFromJson(json);
  }

  @override
  JsonMap toJson() => _$TitleToJson(this);
}

@JsonSerializable()
class Content extends BaseModel {
  final String? rendered;

  Content(this.rendered);

  factory Content.fromJson(JsonMap json) {
    return _$ContentFromJson(json);
  }

  @override
  JsonMap toJson() => _$ContentToJson(this);
}
