import 'package:antidrugs/gen/colors.gen.dart';
import 'package:antidrugs/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class CustomTextButton1 extends StatefulWidget {
  const CustomTextButton1({
    Key? key,
    required this.theme,
    required this.text,
    required this.onTap,
    this.altStyle = false,
    this.textStyle,
  }) : super(key: key);

  final ThemeData theme;
  final String text;
  final void Function() onTap;
  final bool altStyle;
  final TextStyle? textStyle;

  @override
  State<CustomTextButton1> createState() => _CustomTextButtonState1();
}

class _CustomTextButtonState1 extends State<CustomTextButton1> {
  @override
  Widget build(BuildContext context) {
    if (widget.altStyle) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: widget.onTap,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent),
              shape: null,
            ),
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  TextStyle(
                    fontFamily: FontFamily.openSans,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorName.blue.withOpacity(0.75),
                  ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
              child: SizedBox(
                height: 54,
                child: TextButton(
                    onPressed: widget.onTap,
                    child: Text(
                      widget.text,
                      style: widget.textStyle ?? widget.theme.textTheme.labelSmall,
                    )),
              )),
        ],
      );
    }
  }
}