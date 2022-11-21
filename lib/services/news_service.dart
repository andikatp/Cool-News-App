import 'dart:convert';

import 'package:news_cool_app/models/http_exception.dart';
import 'package:news_cool_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String _apiKey = '27b8315985944c3f98d5d1731dd12de4';

  static Future<List<Article>> getNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=$_apiKey');
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode != 200) {
        throw HttpException('Could Not Load News');
      }
      final decode = jsonDecode(response.body);
      return Welcome.fromJson(decode).articles!;
    } catch (error) {
      rethrow;
    }
  }
}
