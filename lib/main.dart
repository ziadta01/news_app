import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/bloc/bloc_observer.dart';
import 'package:news_app/shared/bloc/newsstate/bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/thememode/themebloc/bloc.dart';
import 'package:news_app/shared/thememode/themebloc/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isLight = CacheHelper.getData('isLight');
  runApp(MyApp(isLight));
}

class MyApp extends StatelessWidget {
  final bool? isLight;

  const MyApp(this.isLight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeTheme(
              fromShared: isLight,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStateMode>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            theme: cubit.lightTheme(),
            darkTheme: cubit.darkTheme(),
            themeMode: cubit.isLight ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            title: "News App",
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
