import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/article.dart';

class BookmarkService {
  static const _key = 'bookmarked_articles';

  static Future<void> addBookmark(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getBookmarks();
    current.add(article);
    final encoded = jsonEncode(current.map((a) => a.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  static Future<void> removeBookmark(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getBookmarks();
    current.removeWhere((a) => a.url == article.url);
    final encoded = jsonEncode(current.map((a) => a.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  static Future<List<Article>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];
    final List<dynamic> decoded = jsonDecode(data);
    return decoded.map((json) => Article.fromJson(json)).toList();
  }
}
