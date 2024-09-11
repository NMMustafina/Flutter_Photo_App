import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String textTitle;
  final double paddingBottom;

  const MainTitle({
    Key? key, required this.textTitle, this.paddingBottom = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(
        textTitle.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
