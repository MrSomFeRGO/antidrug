import '../../../core/utils/constants.dart';
import 'package:antidrugs/features/navigation/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar setAppBar(BuildContext context, String title) {
  final theme = Theme.of(context);
  return AppBar(
    elevation: 0,
    leadingWidth: 80,
    leading: _showLeading(context, theme),
    title: Text(title),

  );
}

Widget? _showLeading(BuildContext context, ThemeData theme) {
  // if (GoRouter.of(context).location.contains(Routes.profileNamedPage)) {
  //   return exitButton(theme, context);
  // }
  if (GoRouter.of(context).location.contains('/', 1)) {
    return backButton(context);
  }
  return null;
}
