import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/bookmark_service.dart';

class BookmarkButton extends StatefulWidget {
  final Article article;
  const BookmarkButton({super.key, required this.article});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _loadBookmarkStatus();
  }

  void _loadBookmarkStatus() async {
    final bookmarks = await BookmarkService.getBookmarks();
    setState(() {
      isBookmarked = bookmarks.any((a) => a.url == widget.article.url);
    });
  }

  void _toggleBookmark() async {
    if (isBookmarked) {
      await BookmarkService.removeBookmark(widget.article);
    } else {
      await BookmarkService.addBookmark(widget.article);
    }
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Colors.blue : null,
      ),
      onPressed: _toggleBookmark,
    );
  }
}
