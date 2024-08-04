import 'package:flutter/material.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/news_helper/apis_manager.dart';
import 'news_item.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          APIsManager.getArticles(query: query);
          showResults(context);
        },
        icon: const Icon(Icons.search_outlined),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
       onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.close_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder<ArticlesResponse>(
        future: APIsManager.getArticles(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                return NewsItem(snapshot.data!.articles![index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text(''));
  }
}
