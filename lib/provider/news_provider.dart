import 'package:flutter/material.dart';
import 'package:news_cool_app/models/news_model.dart';
import 'package:news_cool_app/services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _article = [];

  List<Article> get article {
    return [..._article];
  }

  Future<void> getNews() async {
    try {
      final news = await NewsService.getNews();
      _article = news;
    } catch (error) {
      rethrow;
    }
  }
}
