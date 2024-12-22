import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_tiles.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsTilesView extends StatelessWidget {
  const NewsTilesView({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NewsTiles(
        article: articles[index],
      ),
      itemCount: articles.length,
    );
  }
}
