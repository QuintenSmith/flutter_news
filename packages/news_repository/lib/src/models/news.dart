import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/src/models/models.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  String status;
  int? totalResults;
  List<dynamic> articles;
}
