class RecommendedState {}

class RecommendedInitialState extends RecommendedState {}

class RecommendedLoadingState extends RecommendedState {}

class RecommendedLoadedState extends RecommendedState {}

class RecommendedErrorState extends RecommendedState {
  final String message;

  RecommendedErrorState(this.message);
}
