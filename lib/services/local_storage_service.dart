import 'package:shared_preferences/shared_preferences.dart';
import '../models/article.dart';
import 'dart:convert';

class LocalStorageService {
  static const String _loginKey = 'isLoggedIn';
  static const String _bookmarksKey = 'bookmarkedArticles';

  static Future<void> saveLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, status);
  }

  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }

  static Future<void> saveBookmarks(List<Article> articles) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = articles.map((a) => jsonEncode(a.toJson())).toList();
    await prefs.setStringList(_bookmarksKey, jsonList);
  }

  static Future<List<Article>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_bookmarksKey);

    if (jsonList == null) return [];

    return jsonList
        .map((jsonStr) => Article.fromJson(jsonDecode(jsonStr)))
        .toList();
  }
}
