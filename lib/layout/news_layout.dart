import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/search/search_screen.dart';
import 'package:news_app/shared/bloc/newsstate/bloc.dart';
import 'package:news_app/shared/bloc/newsstate/states.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/thememode/themebloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var cubit1 = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  navigatorTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit1.changeTheme();
                },
                icon: const Icon(Icons.brightness_6),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.index,
            onTap: (value) {
              cubit.changeNAVBar(value);
            },
          ),
          body: cubit.screens[cubit.index],
        );
      },
    );
  }
}
