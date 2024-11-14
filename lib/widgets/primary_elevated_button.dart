import 'package:flutter/material.dart';
import 'package:photo_app/theme/styling.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final String textButton;
  final double? paddingBottom;
  final Function()? onPressed;

  const PrimaryElevatedButton(
      {super.key,
      required this.textButton,
      this.paddingBottom,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: b13Bold,
        ),
        child: Text(textButton.toUpperCase()),
      ),
    );
  }
}
