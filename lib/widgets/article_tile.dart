import 'package:flutter/material.dart';
import 'package:news_homework/views/article_view.dart';

class ArticleTile extends StatelessWidget {
  final String? imgUrl, title, desc, url, content;

  const ArticleTile(
      {super.key,
        required this.imgUrl,
        required this.title,
        required this.desc,
        required this.url,
        required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                  imageUrl: imgUrl!,
                  title: title!,
                  url: url!,
                  description: desc!,
                  content: content,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).primaryColor, width: 5.0),
            )),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgUrl!),
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              desc!,
            ),
          ],
        ),
      ),
    );
  }
}
