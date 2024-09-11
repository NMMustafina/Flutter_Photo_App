import 'package:flutter/material.dart';

class ButtonWhite extends StatelessWidget {
  final String textButton;
  final double paddingBottom;
  final Url;

  const ButtonWhite({Key? key, required this.textButton, this.paddingBottom = 20, this.Url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Url,
            ),
          );
        },
        child: OutlinedButton(
          onPressed:
              null, // onPressed отключен, обработка через GestureDetector
          child: Text('$textButton'.toUpperCase()),
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 52)),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.black, width: 2),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ), // ElevatedButton(
      ),
    );
  }
}
