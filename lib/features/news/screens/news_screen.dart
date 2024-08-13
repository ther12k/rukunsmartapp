import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/news/bloc/news_event.dart';
import 'package:rukunsmart/features/news/bloc/news_state.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_list_widget.dart';
import '../../../shared/widgets/loading_indicator.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community News'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            context.read<NewsBloc>().add(LoadNews());
            return const Center(child: LoadingIndicator());
          } else if (state is NewsLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is NewsLoaded) {
            return Column(
              children: [
                _buildCategoryFilter(context, state),
                Expanded(child: NewsList(news: state.news)),
              ],
            );
          } else if (state is NewsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context, NewsLoaded state) {
    final categories = [
      'All',
      ...state.allNews
          .expand((item) => item.categories ?? [])
          .where((category) => category != null)
          .map((category) => category!)
          .toSet()
          .toList()
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == 'All' ? state.selectedCategory.isEmpty : category == state.selectedCategory;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) {
                context.read<NewsBloc>().add(FilterNewsByCategory(category == 'All' ? '' : category));
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}