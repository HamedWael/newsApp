abstract class AppStates {}

class AppInitialState extends AppStates {}

class BottomNavBarState extends AppStates {}

class NewsLoadingState extends AppStates {}

class NewsGetSuccessState extends AppStates {}

class NewsGetErrorState extends AppStates {
  final String error;

  NewsGetErrorState(this.error);
}

class NewsArGetState extends AppStates {}

class SearchNewsLoadingState extends AppStates {}

class SearchNewsGetSuccessState extends AppStates {}

class SearchNewsGetErrorState extends AppStates {
  final String error;

  SearchNewsGetErrorState(this.error);
}

class NewsSelectItemState extends AppStates {}

