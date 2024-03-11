import 'dart:convert';

import 'package:news_homework/models/article_model.dart';
import "package:news_homework/secret.dart";
import 'package:http/http.dart' as http;


class News {
  final List<ArticleModel> news = List<ArticleModel>.empty(growable: true);

  final String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((current){
       if (current['urlToImage'] != null && current['description'] != null) {
         ArticleModel articleModel = ArticleModel(
           author: current['author'],
           title: current['title'],
           description: current['description'],
           url: current['url'],
           urlToImage: current['urlToImage'],
           publishedAt: DateTime.parse(current['publishedAt']),
           content: current['content']
         );

         news.add(articleModel);
       }
      });
    }
  }
}

class CatNews {
  final List<ArticleModel> news = List<ArticleModel>.empty(growable: true);

  Future<void> getCatNews(String category) async {
    final String url = "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((current){
        if (current['urlToImage'] != null && current['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: current['author'],
            title: current['title'],
            description: current['description'],
            url: current['url'],
            urlToImage: current['urlToImage'],
            publishedAt: DateTime.parse(current['publishedAt']),
            content: current['content']
          );

          news.add(articleModel);
        }
      });
    }
  }
}