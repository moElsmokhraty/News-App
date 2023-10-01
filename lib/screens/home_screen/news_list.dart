import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/news_helper/apis_manager.dart';

import 'news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.source, {super.key});

  final Source source;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late ScrollController scrollController;

  int page = 1;

  bool shouldLoadNewPage = false;

  List<Article> news = [];

  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          shouldLoadNewPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLoadNewPage == true) {
      APIsManager.getArticles(sourceId: widget.source.id, page: ++page)
          .then((value) {
        setState(() {
          news.addAll(value.articles!.toList());
          shouldLoadNewPage = false;
        });
      });
    }

    return FutureBuilder<ArticlesResponse>(
      future: APIsManager.getArticles(sourceId: widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (news.isEmpty) {
            news.addAll((snapshot.data!.articles ?? []));
          }
          if (snapshot.data!.articles![0].title != news[0].title) {
            scrollController.jumpTo(0);
            news = snapshot.data!.articles ?? [];
          }
          return ListView.builder(
            controller: scrollController,
            itemCount: news.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsItem(news[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
