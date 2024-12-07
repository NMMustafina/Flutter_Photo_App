import 'package:flutter/material.dart';
import 'package:photo_app/theme/styling.dart';

class MainHeading extends StatelessWidget {
  final String textHeading;
  final double paddingBottom;

  const MainHeading(
      {super.key, required this.textHeading, this.paddingBottom = 30});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Text(
        textHeading,
        style: h36Regular,
      ),
    );
  }
}
