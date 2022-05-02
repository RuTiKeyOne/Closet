import 'package:flutter/material.dart';

class ProfilePartItem extends StatelessWidget {
  final Widget? preIcon;
  final double? verticalPadding;
  final double? horizontalPadding;
  final String value;
  final Widget? postIcon;
  const ProfilePartItem({
    Key? key,
    this.preIcon,
    this.postIcon,
    this.verticalPadding,
    this.horizontalPadding,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.125),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 0,
                horizontal: horizontalPadding ?? 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                preIcon ?? Container(),
                preIcon != null ? const SizedBox(width: 10) : Container(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.headline4!,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                postIcon ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
