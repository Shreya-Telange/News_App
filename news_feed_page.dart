import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import '../models/article.dart';
import '../services/news_service.dart';
import '../pages/article_webview_page.dart';
import '../widgets/article_card.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late Future<List<Article>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService.fetchNews();
  }

  Future<void> _refreshNews() async {
    setState(() {
      _newsFuture = NewsService.fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: RefreshIndicator(
        onRefresh: _refreshNews,
        child: FutureBuilder<List<Article>>(
          future: _newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final articles = snapshot.data ?? [];

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ArticleCard(
                  article: article,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ArticleWebViewPage(url: article.url),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
