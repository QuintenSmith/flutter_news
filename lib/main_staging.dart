import 'package:flutter/foundation.dart';
import 'package:flutter_news/app/app.dart';
import 'package:flutter_news/bootstrap.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
        () => runApp(App(newsRepository: NewsRepository())),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
  //bootstrap(() => const App());
}