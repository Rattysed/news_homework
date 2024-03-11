import 'package:news_homework/helper/data.dart';

import 'package:news_homework/models/category_model.dart';
import 'package:news_homework/theme/theme.dart';
import 'package:news_homework/widgets/article_tile.dart' show ArticleTile;
import 'package:news_homework/views/category_news.dart';

import 'package:news_homework/helper/news.dart';
import 'package:news_homework/models/article_model.dart';

import 'package:news_homework/widgets/theme_button.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<CategoryModel> categories;
  late final List<ArticleModel> articles;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsTable = News();
    await newsTable.getNews();

    articles = newsTable.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Text("Ratten"),
                  Text(
                    "News",
                    style: TextStyle(color: primaryColor),
                  )
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
                    /// Categories
                    SizedBox(
                      height: 64,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryTile(
                                categoryName: categories[index].categoryName,
                              )),
                    ),

                    /// Blogs
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
              ),
      );
}

class CategoryTile extends StatelessWidget {
  final String? categoryName;

  const CategoryTile({super.key, this.categoryName});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoryNews(category: categoryName!.toLowerCase())));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
              ),
              Container(
                alignment: Alignment.center,
                width: 116,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: Text(
                  categoryName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

