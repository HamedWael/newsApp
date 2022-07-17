abstract class AppStates {}

class AppInitialState extends AppStates {}

class BottomNavBarState extends AppStates {}

class NewsLoadingState extends AppStates {}

class NewsGetSuccessState extends AppStates {}

class NewsGetErrorState extends AppStates {
  final String error;

  NewsGetErrorState(this.error);
}

