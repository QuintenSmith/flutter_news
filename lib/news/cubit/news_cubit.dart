import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/news_repository.dart'
    show NewsRepository;

import '../models/news.dart';

part 'news_cubit.g.dart';
part 'news_state.dart';

class NewsCubit extends HydratedCubit<NewsState> {
  NewsCubit(this._newsRepository) : super(NewsState());

  final NewsRepository _newsRepository;

  Future<void> fetchNews(String? searchTxt) async {
    if(searchTxt == null || searchTxt.isEmpty) return;

    emit(state.copyWith(status: NewsStatus.loading));

    try {
      final news = News.fromRepository(
        await _newsRepository.searchNews(searchTxt),
      );

      emit(
        state.copyWith(
          status: NewsStatus.success,
          news: news.copyWith(
            status: news.status,
            totalResults: news.totalResults,
            articles: news.articles,
          )
        ),
      );

    } catch(e) {
      emit(state.copyWith(status: NewsStatus.failure));
      print(e);
    }
  }

  @override
  NewsState fromJson(Map<String, dynamic> json) => NewsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(NewsState state) => state.toJson();
}