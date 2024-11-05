import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String textTitle;
  final double paddingBottom;

  const MainTitle(
      {super.key, required this.textTitle, this.paddingBottom = 20});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(
        textTitle.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
