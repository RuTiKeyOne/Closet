import 'package:flutter/material.dart';

class TextFormFieldTypeTwo extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String val) onTextChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? autofocus;
  final void Function(String)? onFieldSubmitted;
  final String label;
  const TextFormFieldTypeTwo({
    Key? key,
    this.obscureText,
    this.controller,
    this.autofocus,
    this.onFieldSubmitted,
    required this.onTextChanged,
    required this.validator,
    required this.textInputAction,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      textInputAction: textInputAction,
      autofocus: autofocus ?? false,
      onChanged: onTextChanged,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Theme.of(context).primaryColorDark,
          ),
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).errorColor,
            ),
        label: Text(label),
        labelStyle: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).primaryColorLight),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).primaryColorDark),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}
