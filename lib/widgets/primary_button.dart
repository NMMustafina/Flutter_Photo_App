import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final double? paddingBottom;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onPressed;

  const PrimaryButton(
      {Key? key,
      required this.textButton,
      this.paddingBottom,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('$textButton'.toUpperCase()),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? Colors.black,
          foregroundColor: foregroundColor ?? Colors.white,
          side: BorderSide(color: Colors.black, width: 2),
          minimumSize: Size(double.infinity, 52),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
