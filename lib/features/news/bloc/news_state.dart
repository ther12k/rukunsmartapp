import 'package:rukunsmart/features/news/models/news_item.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsItem> news;
  final List<NewsItem> allNews;
  final String selectedCategory;

  NewsLoaded(this.news, this.allNews, {this.selectedCategory = ''});
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}