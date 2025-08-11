abstract class PopularState {
  const PopularState();
}

class PopularInitialState extends PopularState {}

class PopularLoadingState extends PopularState {}

class PopularLoadedState extends PopularState {}

class PopularErrorState extends PopularState {
  final String message;

  const PopularErrorState(this.message);
}
