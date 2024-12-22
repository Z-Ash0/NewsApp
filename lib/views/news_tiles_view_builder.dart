import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/connection_failed.dart';
import 'package:news_app_ui_setup/services/news_services.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/views/news_tiles_view.dart';

class NewsTilesViewBuilder extends StatefulWidget {
  const NewsTilesViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsTilesViewBuilder> createState() => _NewsTilesViewBuilderState();
}

class _NewsTilesViewBuilderState extends State<NewsTilesViewBuilder> {
  late Future<List<ArticleModel>> _future;
  @override
  void initState() {
    // initState is the first step of the StatefulWidget - We can't use async with initState()
    super.initState();
    _future = NewServices(Dio()).getNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: _future,
        builder: (context, snapdshot) {
          if (snapdshot.hasData) {
            return NewsTilesView(articles: snapdshot.data!);
          } else if (snapdshot.hasError) {
            return const ConnectionError();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
