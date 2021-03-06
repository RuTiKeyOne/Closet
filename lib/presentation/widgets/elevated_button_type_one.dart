import 'package:flutter/material.dart';

class ElevatedButtonTypeOne extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color backgroundColor;
  const ElevatedButtonTypeOne({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
