import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  final String textHeading;
  final double paddingBottom;

  const MainHeading(
      {Key? key, required this.textHeading, this.paddingBottom = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(
        textHeading,
        style: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 36,
        ),
      ),
    );
  }
}
