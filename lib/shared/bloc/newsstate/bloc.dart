import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/business/businees_screen.dart';
import 'package:news_app/models/science/science_screen.dart';
import 'package:news_app/models/sports/sports_screen.dart';
import 'package:news_app/shared/bloc/newsstate/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'Insert Your API Key',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(NewsBusinessSuccessState());
      }).catchError((error) {
        emit(NewsBusinessFailedState(error.toString()));
      });
    } else {
      emit(NewsBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'Insert Your API Key',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsSportsSuccessState());
      }).catchError((error) {
        emit(NewsSportsFailedState(error.toString()));
      });
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'Insert Your API Key',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsScienceSuccessState());
      }).catchError((error) {
        emit(NewsScienceFailedState(error.toString()));
      });
    } else {
      emit(NewsScienceSuccessState());
    }
  }

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  void changeNAVBar(int value) {
    index = value;
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];
    if (search.isEmpty) {
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'sortBy': 'popularity',
          'apiKey': 'Insert Your API Key',
        },
      ).then((value) {
        search = value.data['articles'];
        emit(NewsSearchSuccessState());
      }).catchError((error) {
        emit(NewsSearchFailedState(error.toString()));
      });
    } else {
      emit(NewsSearchSuccessState());
    }
  }
}
