class ArticleModel {
  final String? title, subTitle, image, url;
  const ArticleModel(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.url});

  factory ArticleModel.fromJson(article) {
    return ArticleModel(
        image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description'],
        url: article['url']);
  }
}
