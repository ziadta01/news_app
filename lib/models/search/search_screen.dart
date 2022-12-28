// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc/newsstate/bloc.dart';
import 'package:news_app/shared/bloc/newsstate/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: textFieldBuilder(
                  controller: textController,
                  label: 'Search',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Search must not be empty";
                    }
                    return null;
                  },
                  onSubmit: (String value) {
                      cubit.getSearch(value);
                  },
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: list.isNotEmpty,
                  fallback: (context) => Container(),
                  builder: (context) {
                    return ListView.separated(
                      itemBuilder: (context, index) =>
                          buildArticle(list[index], context),
                      separatorBuilder: (context, index) => articleLine(),
                      itemCount: list.length,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
