import 'package:flutter/material.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';
import 'package:scene/features/search/presentation/widgets/search_item_card.dart';

class CommonMovieList extends StatelessWidget {
  const CommonMovieList({super.key, required this.movies});
  final List<CommonItemEntity> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      addAutomaticKeepAlives: true,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder:
          (context, index) => CommonMovieListItem(searchEntity: movies[index]),
    );
  }
}
