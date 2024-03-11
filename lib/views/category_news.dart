import 'package:flutter/material.dart';
import 'package:news_homework/theme/theme.dart';

import 'package:news_homework/widgets/theme_button.dart';
import 'package:news_homework/models/article_model.dart';
import 'package:news_homework/helper/news.dart';

import 'package:news_homework/widgets/article_tile.dart' show ArticleTile;

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({super.key, required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late final List<ArticleModel> articles;
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    getCatNews();
  }

  getCatNews() async {
    CatNews newsTable = CatNews();
    await newsTable.getCatNews(widget.category);

    articles = newsTable.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Rat"),
                const Text(
                  "News",
                  style: TextStyle(color: primaryColor),
                ),
                const Text(": "),
                Text(widget.category),
              ],
            ),
            ToggleThemeButton(),
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) => ArticleTile(
                              imgUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                              content: articles[index].content,
                            )),
                  ),
                ],
              ),
            ));
}
