
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/features/home/widgets/popular/domain/entities/popular_movies_entity.dart';
import 'package:scene/features/home/widgets/popular/domain/usecases/get_popular_use_case.dart';
import 'package:scene/features/home/widgets/popular/presentation/cubit/popular_state.dart';

@lazySingleton
class PopularCubit extends Cubit<PopularState> {
  final GetPopularUseCase getPopularUseCase;
  PopularMoviesEntity? posters;
  PopularCubit({required this.getPopularUseCase})
    : super(PopularInitialState()) {
    fetchPopularMovies();
  }
  Future<void> fetchPopularMovies() async {
    emit(PopularLoadingState());
    var result = await getPopularUseCase();
    if (result.$1 == null) {
      posters = result.$2;
      emit(PopularLoadedState());
    } else {
      emit(PopularErrorState(result.$1!.message));
    }
  }
}
