import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/bookmark_service.dart';
import '../widgets/article_card.dart';
import 'article_webview_page.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Future<List<Article>> _bookmarks;

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void _loadBookmarks() {
    _bookmarks = BookmarkService.getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _bookmarks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No bookmarks yet.'));
        }

        final articles = snapshot.data!;
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => ArticleCard(
            article: articles[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ArticleWebViewPage(url: articles[index].url),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
