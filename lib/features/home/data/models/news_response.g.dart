// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      json['title'] as String,
      json['content'] as String,
      Author.fromJson(json['author'] as Map<String, dynamic>),
      json['date'] as String,
      json['youtube_video_code'] as String,
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'date': instance.date,
      'youtube_video_code': instance.youtube_video_code,
      'thumbnail': instance.thumbnail,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['name'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
    };
