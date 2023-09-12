import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

Widget backButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      var previewLocation = GoRouter.of(context).location;
      context.pop();
      if (GoRouter.of(context).location == previewLocation) {
        context.pop();
      }

      GetIt.I<AppbarBloc>().add(AppbarRemoveLastTitle());
    },
    icon: Icon(
      Icons.arrow_back_ios,
      color: ColorName.blue.withOpacity(0.75),
    ),
  );
}
