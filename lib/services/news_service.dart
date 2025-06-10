import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String _apiKey = '5e4006a9267846f6ad97428390e73328'; // Get your key from newsapi.org
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  static Future<List<Article>> fetchNews() async {
    final url = Uri.parse('$_baseUrl&apiKey=$_apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesJson = jsonData['articles'];

      List<Article> articles = articlesJson
          .map((json) => Article.fromJson(json))
          .toList();

      return articles;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
