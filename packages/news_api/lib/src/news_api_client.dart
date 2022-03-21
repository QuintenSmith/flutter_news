import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../news_api.dart';

class NewsIdRequestFailure implements Exception {}
class NewsNotFoundFailure implements Exception {}

class NewsApiClient {

  NewsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = "newsapi.org";
  static const _apiKey = '';
  final http.Client _httpClient;

  Future<News> newsSearch(String query) async {
    try {
      final newsRequest = Uri.https(
          _baseUrl,
          '/v2/everything',
        {'q': query, 'apiKey': _apiKey }
      );
      final newsResponse = await _httpClient.get(newsRequest);
      if(newsResponse.statusCode != 200) {
        throw NewsIdRequestFailure();
      }

      final newsJson = jsonDecode(
        newsResponse.body,
      ) as Map<String, dynamic>;

      if (newsJson.isEmpty) {
        throw NewsNotFoundFailure();
      }

      return News.fromJson(newsJson);
    } catch(e) {
      print(e);
      throw NewsNotFoundFailure();
    }
  }
}