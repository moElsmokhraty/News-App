import 'article.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<Article>? articles;

  ArticlesResponse({
    this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['code'] = code;
    map['message'] = message;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
