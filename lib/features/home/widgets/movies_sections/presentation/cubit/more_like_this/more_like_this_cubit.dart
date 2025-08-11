import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/entity/recommended_entity.dart';
import 'package:scene/features/home/widgets/movies_sections/domain/use%20cases/fetch_more_like_this_use_case.dart';
import 'package:scene/features/home/widgets/movies_sections/presentation/cubit/more_like_this/more_like_this_states.dart';

@LazySingleton()
class MoreLikeThisCubit extends Cubit<MoreLikeThisState> {
  final FetchMoreLikeThisUseCase _fetchMoreLikeThisUseCase;
  List<SectionsEntity>? moreLikeThisMovies;
  MoreLikeThisCubit(this._fetchMoreLikeThisUseCase)
    : super(MoreLikeThisInitialState());

  void fetchMoreLikeThis(String movieId) async {
    emit(MoreLikeThisLoadingState());
    final (failure, response) = await _fetchMoreLikeThisUseCase.call(movieId);
    if (failure == null) {
      moreLikeThisMovies = response?.movies;
      emit(MoreLikeThisLoadedState());
    } else {
      emit(MoreLikeThisErrorState(failure.message));
    }
  }
}
