import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/news/bloc/news_event.dart';
import 'package:rukunsmart/features/news/bloc/news_state.dart';
import 'package:rukunsmart/features/news/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
    on<FilterNewsByCategory>(_onFilterNewsByCategory);
  }

  void _onLoadNews(LoadNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final news = await newsRepository.getNews();
      emit(NewsLoaded(news, news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void _onFilterNewsByCategory(
      FilterNewsByCategory event, Emitter<NewsState> emit) {
    final currentState = state;
    if (currentState is NewsLoaded) {
      final filteredNews = event.category.isEmpty
          ? currentState.allNews
          : currentState.allNews
              .where((item) => item.categories.contains(event.category))
              .toList();
      emit(NewsLoaded(filteredNews, currentState.allNews,
          selectedCategory: event.category));
    }
  }
}
