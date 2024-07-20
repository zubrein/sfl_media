// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      (json['id'] as num).toInt(),
      json['date'] as String,
      json['link'] as String,
      Title.fromJson(json['title'] as Map<String, dynamic>),
      (json['author'] as num).toInt(),
      Content.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'date': instance.date,
      'title': instance.title,
      'content': instance.content,
      'link': instance.link,
    };

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      json['rendered'] as String?,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'rendered': instance.rendered,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['rendered'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'rendered': instance.rendered,
    };
