import 'package:equatable/equatable.dart';
import 'package:flutter_news/news/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/news_repository.dart' hide News, Article;
import 'package:news_repository/news_repository.dart' as news_repository;

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  factory News.fromRepository(news_repository.News news) {
    return News(
      totalResults: news.totalResults ?? 0,
      status: news.status,
      articles: news.articles.cast<dynamic>(),
    );
  }

  final String status;
  final dynamic totalResults;
  final List<dynamic> articles;

  @override
  List<Object?> get props => [totalResults, status, articles];

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  News copyWith({
    String? status,
    dynamic totalResults,
    List<dynamic>? articles
  }) {
    return News(
      totalResults: totalResults ?? this.totalResults,
      status: status ?? this.status,
      articles: articles ?? this.articles,
    );
  }
}
