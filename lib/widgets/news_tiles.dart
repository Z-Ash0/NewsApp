import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/views/web_view_page.dart';

class NewsTiles extends StatelessWidget {
  const NewsTiles({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    if ((article.title?.isEmpty ?? true) ||
        (article.subTitle?.isEmpty ?? true) ||
        (article.image?.isEmpty ?? true)) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: GestureDetector(
        onTap: () => navigateToWebview(context),
        child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.5),
                )
              ],
              color: const Color.fromARGB(255, 226, 226, 226),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                imageView(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        article.title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        article.subTitle!,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget imageView() => ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          imageUrl: article.image!,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset(
            'assets/download.png',
            fit: BoxFit.fill,
          ),
        ),
      );

  void navigateToWebview(BuildContext context) {
    if (!(article.url?.isEmpty ?? true)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WebviewPage(url: article.url!);
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('There\'s no URL to this article'),
        ),
      );
    }
  }
}
