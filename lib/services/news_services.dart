import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewServices {
  final Dio dio;
  const NewServices(this.dio);

  Future<List<ArticleModel>> getNews(String category) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=f698d5da426a4f71acfd883cf54eb815&category=$category&country=us');
    List<ArticleModel>? articlesModel = [];
    for (var article in response.data['articles']) {
      articlesModel.add(
        ArticleModel.fromJson(article),
      );
    }
    return articlesModel;
  }
}
