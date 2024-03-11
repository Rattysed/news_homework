import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_homework/widgets/error_image.dart';
import "package:news_homework/widgets/theme_button.dart";

class ArticleView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String? content;

  const ArticleView(
      {super.key,
        required this.imageUrl,
        required this.title,
        required this.description,
        required this.url,
        required this.content});

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Feed", style: TextStyle(color: Colors.orangeAccent)),
                ],
              ),
              ToggleButtonsSample()
            ],
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image.network(imageUrl, errorBuilder:
                      (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const ErrorImage();
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  (content != null) ? content! : "",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: _launchUrl,
                    child: Text(
                      "More...",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
