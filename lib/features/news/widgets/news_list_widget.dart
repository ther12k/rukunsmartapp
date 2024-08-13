import 'package:flutter/material.dart';
import 'package:rukunsmart/features/news/widgets/news_card_widget.dart';
import '../models/news_item.dart';

class NewsList extends StatelessWidget {
  final List<NewsItem> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return NewsCard(newsItem: news[index]);
      },
    );
  }
}
