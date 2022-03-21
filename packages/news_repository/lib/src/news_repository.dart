import 'dart:async';

import 'package:news_api/news_api.dart' hide News, Article;
import 'package:news_repository/news_repository.dart';

class NewsFailure implements Exception {}

class NewsRepository {
  NewsRepository({NewsApiClient? newsApiClient})
      : _newsApiClient = newsApiClient ?? NewsApiClient();

  final NewsApiClient _newsApiClient;

  Future<News> searchNews(String query) async {
    try {
      final news = await _newsApiClient.newsSearch(query);
      return News(
          articles: news.articles,
          status: news.status,
          totalResults: news.totalResults ?? 0
      );
    } catch(e) {
      print(e);
      return News(
          articles: [],
          status: '',
          totalResults: 0
      );
    }
  }
}