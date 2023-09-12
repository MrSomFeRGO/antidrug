import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.isObscure,
    required this.isPhone,
    required this.onChange,
    required this.textEditingController,
    required this.theme,
    this.suffixIcon,
  }) : super(key: key);

  final String hint;
  final bool isObscure;
  final bool isPhone;
  final void Function(String value) onChange;
  final TextEditingController textEditingController;
  final ThemeData theme;
  final Icon? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isPhone) {
      return SizedBox(
        height: 54,
        child: TextField(
          keyboardType: TextInputType.phone,
          autocorrect: false,
          inputFormatters: [MaskedInputFormatter('+(###) ##-###-###')],
          style: widget.theme.textTheme.labelMedium,
          controller: widget.textEditingController,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: const Color(0xff999999),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 54,
        child: TextField(
          obscureText: widget.isObscure,
          style: widget.theme.textTheme.labelMedium,
          controller: widget.textEditingController,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: const Color(0xff999999),
          ),
        ),
      );
    }
  }
}
