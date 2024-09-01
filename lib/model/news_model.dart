// Package imports:
import 'package:hive/hive.dart';

part 'news_model.g.dart';

class NewsModel {
  String status;
  int totalResults;
  List<Articles> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? '',
        totalResults = json['totalResults'] ?? 0,
        articles = (json['articles'] as List<dynamic>?)
                ?.map((v) => Articles.fromJson(v))
                .toList() ??
            [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles.map((v) => v.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 101)
class Articles {
  @HiveField(0)
  String sourceName;
  @HiveField(1)
  String author;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  String url;
  @HiveField(5)
  String urlToImage;
  @HiveField(6)
  String publishedAt;
  @HiveField(7)
  String content;

  Articles({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Articles.fromJson(Map<String, dynamic> json)
      : sourceName = json['source'] != null
            ? Source.fromJson(json['source']).name
            : '',
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourceName'] = sourceName;
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
