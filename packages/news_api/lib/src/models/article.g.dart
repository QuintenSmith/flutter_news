// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Article',
      json,
      ($checkedConvert) {
        final val = Article(
          source: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : Source.fromJson(v as Map<String, dynamic>)),
          author: $checkedConvert('author', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
          urlToImage: $checkedConvert('url_to_image', (v) => v as String?),
          publishedAt: $checkedConvert('published_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          content: $checkedConvert('content', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'urlToImage': 'url_to_image',
        'publishedAt': 'published_at'
      },
    );
