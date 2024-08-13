import 'package:flutter/material.dart';
import '../models/news_item.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('MMMM d, yyyy').format(newsItem.date),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(newsItem.content),
            const SizedBox(height: 8),
            if (newsItem.categories.isNotEmpty)
              Wrap(
                spacing: 8,
                children: newsItem.categories!.map((category) {
                  return Chip(
                    label: Text(category),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
