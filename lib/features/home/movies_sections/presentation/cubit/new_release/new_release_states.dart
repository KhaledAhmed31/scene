class NewReleaseState {}

class NewReleaseInitialState extends NewReleaseState {}

class NewReleaseLoadingState extends NewReleaseState {}

class NewReleaseLoadedState extends NewReleaseState {}

class NewReleaseErrorState extends NewReleaseState {
  final String message;
  NewReleaseErrorState(this.message);
}
