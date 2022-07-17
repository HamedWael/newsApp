abstract class AppStates {}

class AppInitialState extends AppStates {}

class BottomNavBarState extends AppStates {}

class NewsLoadingState extends AppStates {}

class NewsGetSuccessState extends AppStates {}

class NewsGetErrorState extends AppStates {
  late final String error;
}

class PopularNewsLoadingState extends AppStates {}

class PopularNewsGetSuccessState extends AppStates {}

class PopularNewsGetErrorState extends AppStates {
  final String error;

  PopularNewsGetErrorState(this.error);
}
