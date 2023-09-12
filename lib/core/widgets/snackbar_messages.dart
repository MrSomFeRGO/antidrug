import 'package:another_flushbar/flushbar.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';

void showSuccessMessage(
    {required String title,
      required String desc,
      required BuildContext context}) {
  final theme = Theme.of(context);

  Flushbar(
    titleText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        desc,
        style: theme.textTheme.bodyMedium,
      ),
    ),
    duration: const Duration(seconds: 5),
    icon:  const Padding(
      padding: EdgeInsets.only(bottom: 26, left: 8),
      child: Icon(
        Icons.check_circle,
        size: 32.0,
        color: ColorName.success,
      ),
    ),
    isDismissible: true,
    shouldIconPulse: false,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: ColorName.lightSuccess,
    leftBarIndicatorColor: ColorName.success,
    boxShadows: [BoxShadow(
      offset: const Offset(4, 4),
      spreadRadius: 2,
      blurRadius: 18,
      color: ColorName.black.withOpacity(0.25),
    )],
  ).show(context);
}

void showWarningMessage(
    {required String title,
      required String desc,
      required BuildContext context}) {
  final theme = Theme.of(context);

  Flushbar(
    titleText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        desc,
        style: theme.textTheme.bodyMedium,
      ),
    ),
    duration: const Duration(seconds: 5),
    icon:  const Padding(
      padding: EdgeInsets.only(bottom: 26, left: 8),
      child: Icon(
        Icons.warning,
        size: 32.0,
        color: ColorName.warning,
      ),
    ),
    isDismissible: true,
    shouldIconPulse: false,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: ColorName.lightWarning,
    leftBarIndicatorColor: ColorName.warning,
    boxShadows: [BoxShadow(
      offset: const Offset(4, 4),
      spreadRadius: 2,
      blurRadius: 18,
      color: ColorName.black.withOpacity(0.25),
    )],
  ).show(context);
}

void showErrorMessage(
    {required String title,
      required String desc,
      required BuildContext context}) {
  final theme = Theme.of(context);

  Flushbar(
    titleText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        desc,
        style: theme.textTheme.bodyMedium,
      ),
    ),
    duration: const Duration(seconds: 5),
    icon:  const Padding(
      padding: EdgeInsets.only(bottom: 26, left: 8),
      child: Icon(
        Icons.error,
        size: 32.0,
        color: ColorName.error,
      ),
    ),
    isDismissible: true,
    shouldIconPulse: false,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: ColorName.lightError,
    leftBarIndicatorColor: ColorName.error,
    boxShadows: [BoxShadow(
      offset: const Offset(4, 4),
      spreadRadius: 2,
      blurRadius: 18,
      color: ColorName.black.withOpacity(0.25),
    )],
  ).show(context);
}

void showInfoMessage(
    {required String title,
      required String desc,
      required BuildContext context}) {
  final theme = Theme.of(context);

  Flushbar(
    titleText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        desc,
        style: theme.textTheme.bodyMedium,
      ),
    ),
    duration: const Duration(seconds: 5),
    icon:  const Padding(
      padding: EdgeInsets.only(bottom: 26, left: 8),
      child: Icon(
        Icons.info,
        size: 32.0,
        color: ColorName.info,
      ),
    ),
    isDismissible: true,
    shouldIconPulse: false,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: ColorName.lightInfo,
    leftBarIndicatorColor: ColorName.info,
    boxShadows: [BoxShadow(
      offset: const Offset(4, 4),
      spreadRadius: 2,
      blurRadius: 18,
      color: ColorName.black.withOpacity(0.25),
    )],
  ).show(context);
}