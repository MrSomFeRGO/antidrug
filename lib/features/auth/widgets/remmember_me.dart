import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe(
      {Key? key,
      required this.theme,
      required this.onChanged,
      required this.value})
      : super(key: key);

  final ThemeData theme;
  final void Function(bool? value) onChanged;
  final bool? value;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Запомнить',
              style: widget.theme.textTheme.titleMedium,
            ),
          ),
          Checkbox(
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
