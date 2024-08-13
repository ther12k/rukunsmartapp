import '../models/news_item.dart';

class NewsRepository {
  // Simulated API call
  Future<List<NewsItem>> getNews() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      NewsItem(
        id: '1',
        title: 'Community Clean-up Day',
        content:
            'Join us this Saturday for our annual community clean-up day...',
        date: DateTime.now().subtract(const Duration(days: 2)),
        categories: ['Event', 'Environment'],
      ),
      NewsItem(
        id: '2',
        title: 'New Playground Equipment Installed',
        content: 'We'
            're excited to announce that new playground equipment has been installed...',
        date: DateTime.now().subtract(const Duration(days: 5)),
        categories: ['Announcement', 'Infrastructure'],
      ),
      // Add more news items as needed
    ];
  }
}
