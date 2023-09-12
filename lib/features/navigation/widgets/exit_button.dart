
import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/repository/local/abstract_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

Widget exitButton(ThemeData theme, BuildContext context) {
  return TextButton(
    onPressed: () {
      GetIt.I<AbstractLocalRepository>().setValue('isLogout', true);
      context.go(Routes.loginNamedPage);
    },
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(theme.textTheme.displayMedium),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      shape: null,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    ),
    child: Text('Выход'),
  );
}
