class NewsItem {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final List<String> categories;

  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.categories,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      categories: List<String>.from(json['categories']),
    );
  }
}