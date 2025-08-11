import 'package:scene/core/movies/model/common_response_model.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';

extension SearchMapper on CommonResponseModel {
  CommonResponseEntity toEntity() => CommonResponseEntity(
    results:
        (results ?? [])
            .map(
              (e) => CommonItemEntity(
                id: e.id,
                title: e.title,
                backdropPath: e.backdropPath,
                releaseDate: e.releaseDate,
              ),
            )
            .toList(),
  );
}
