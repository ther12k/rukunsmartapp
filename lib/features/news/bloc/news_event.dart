abstract class NewsEvent {}

class LoadNews extends NewsEvent {}

class FilterNewsByCategory extends NewsEvent {
  final String category;
  FilterNewsByCategory(this.category);
}
