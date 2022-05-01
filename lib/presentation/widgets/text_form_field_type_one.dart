import 'package:flutter/material.dart';

class TextFormFieldTypeOne extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String val) onTextChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final bool? obscureText;
  const TextFormFieldTypeOne({
    Key? key,
    this.obscureText,
    this.controller,
    required this.onTextChanged,
    required this.validator,
    required this.hintText,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onTextChanged,
      validator: validator,
      style: Theme.of(context).textTheme.headline3,
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Theme.of(context).errorColor, fontSize: 14),
        isDense: true,
        hintStyle: Theme.of(context).textTheme.headline3,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        hintText: hintText,
      ),
    );
  }
}
