import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc/newsstate/bloc.dart';
import 'package:news_app/shared/bloc/newsstate/states.dart';
import 'package:news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsBusinessLoadingState,
          builder: (context) {
            return ListView.separated(
              itemBuilder: (context, index) => buildArticle(list[index], context),
              separatorBuilder: (context, index) => articleLine(),
              itemCount: list.length,
            );
          },
          fallback: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            );
          },
        );
      },
    );
  }
}
