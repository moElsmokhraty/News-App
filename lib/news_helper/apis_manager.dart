import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';

class APIsManager {
  static Future<SourcesResponse> getSources({String? category}) async {
    Uri url = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
      'apiKey': 'db622849c5144a1ab3c9f39e77601812',
      'category': category,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return SourcesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(SourcesResponse().message ?? 'unable to reach server');
    }
  }

  static Future<ArticlesResponse> getArticles({
    String? sourceId,
    String? query,
    int? page = 1,
  }) async {
    Uri url = Uri.https('newsapi.org', '/v2/everything', {
      'apiKey': 'db622849c5144a1ab3c9f39e77601812',
      'sources': sourceId,
      'q': query,
      'page': '$page',
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return ArticlesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ArticlesResponse().message ?? 'unable to reach server';
    }
  }
}
