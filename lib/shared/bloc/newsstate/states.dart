abstract class NewsState {}

class NewsInitialState extends NewsState {}

class ChangeBottomNavBarState extends NewsState {}

class NewsBusinessLoadingState extends NewsState {}

class NewsBusinessSuccessState extends NewsState {}

class NewsBusinessFailedState extends NewsState {
  final String? error;

  NewsBusinessFailedState(this.error);
}

class NewsSportsLoadingState extends NewsState {}

class NewsSportsSuccessState extends NewsState {}

class NewsSportsFailedState extends NewsState {
  final String? error;

  NewsSportsFailedState(this.error);
}

class NewsScienceLoadingState extends NewsState {}

class NewsScienceSuccessState extends NewsState {}

class NewsScienceFailedState extends NewsState {
  final String? error;

  NewsScienceFailedState(this.error);
}

class NewsSearchLoadingState extends NewsState {}

class NewsSearchSuccessState extends NewsState {}

class NewsSearchFailedState extends NewsState {
  final String? error;

  NewsSearchFailedState(this.error);
}

