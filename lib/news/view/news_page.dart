import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/news/cubit/news_cubit.dart';
import 'package:news_repository/news_repository.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        context.read<NewsRepository>(),
      )..fetchNews('Techcrunch'),
      child: NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewsCubit>().state;
    switch (state.status) {
      case NewsStatus.failure:
        return const Center(child: Text('Oops something went wrong.'));
      case NewsStatus.success:
        return ArticleListView(articles: state.news.articles);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
    );
  }
}

class ArticleListView extends StatelessWidget {
  const ArticleListView({Key? key, required this.articles}) : super(key: key);

  final List<dynamic> articles;

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? const Center(child: Text('no content'))
        : Scaffold(
            appBar: AppBar(
              title: const Text('Results'),
            ),
            body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text(articles[index]['title'].toString());
              },
              itemCount: articles.length,
            ),
          );
  }
}
