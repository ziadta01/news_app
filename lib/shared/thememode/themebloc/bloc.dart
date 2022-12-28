import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/thememode/themebloc/states.dart';

class AppCubit extends Cubit<AppStateMode> {
  AppCubit() : super(InitialThemeModeState());

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: Colors.grey,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 25.0,
        selectedItemColor: Colors.deepOrange,
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: Colors.grey,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: HexColor('#323232'),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: HexColor('#323232'),
        ),
        backgroundColor: HexColor('#323232'),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('#323232'),
        elevation: 25.0,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  bool isLight = true;

  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isLight = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isLight = !isLight;
      CacheHelper.pubData(isLight).then(
        (value) => {
          emit(ChangeThemeModeState()),
        },
      );
    }
  }
}
