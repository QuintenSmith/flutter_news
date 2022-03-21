part of 'news_cubit.dart';

enum NewsStatus { initial, loading, success, failure }

extension NewsStatusX on NewsStatus {
  bool get isInitial => this == NewsStatus.initial;
  bool get isLoading => this == NewsStatus.loading;
  bool get isSuccess => this == NewsStatus.success;
  bool get isFailure => this == NewsStatus.failure;
}

@JsonSerializable()
class NewsState extends Equatable {
  NewsState({
    this.status = NewsStatus.initial,
    News? news,
  }) : news = news ?? News(status: '', totalResults: 0, articles: []);

  factory NewsState.fromJson(Map<String, dynamic> json) => _$NewsStateFromJson(json);

  final NewsStatus status;
  final News news;

  NewsState copyWith({
    NewsStatus? status,
    News? news,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  Map<String, dynamic> toJson() => _$NewsStateToJson(this);

  @override
  List<Object?> get props => [status, news];


}