class MoreLikeThisState {}

class MoreLikeThisInitialState extends MoreLikeThisState {}

class MoreLikeThisLoadingState extends MoreLikeThisState {}

class MoreLikeThisLoadedState extends MoreLikeThisState {}

class MoreLikeThisErrorState extends MoreLikeThisState {
  final String message;
  MoreLikeThisErrorState(this.message);
}
