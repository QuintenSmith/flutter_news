// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'News',
      json,
      ($checkedConvert) {
        final val = News(
          status: $checkedConvert('status', (v) => v as String),
          totalResults: $checkedConvert('total_results', (v) => v as int?),
          articles: $checkedConvert('articles', (v) => v as List<dynamic>),
        );
        return val;
      },
      fieldKeyMap: const {'totalResults': 'total_results'},
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'status': instance.status,
      'total_results': instance.totalResults,
      'articles': instance.articles,
    };
