// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListResponse _$NewsListResponseFromJson(Map<String, dynamic> json) =>
    NewsListResponse(
      (json['list'] as List<dynamic>?)
              ?.map((e) => NewsResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NewsListResponseToJson(NewsListResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
