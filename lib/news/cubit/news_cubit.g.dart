// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsState _$NewsStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NewsState',
      json,
      ($checkedConvert) {
        final val = NewsState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$NewsStatusEnumMap, v) ??
                  NewsStatus.initial),
          news: $checkedConvert(
              'news',
              (v) =>
                  v == null ? null : News.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$NewsStateToJson(NewsState instance) => <String, dynamic>{
      'status': _$NewsStatusEnumMap[instance.status],
      'news': instance.news.toJson(),
    };

const _$NewsStatusEnumMap = {
  NewsStatus.initial: 'initial',
  NewsStatus.loading: 'loading',
  NewsStatus.success: 'success',
  NewsStatus.failure: 'failure',
};
