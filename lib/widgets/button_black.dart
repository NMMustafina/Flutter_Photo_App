import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  final String textButton;
  final double paddingBottom;
  final Url;

  const ButtonBlack({Key? key, required this.textButton, this.paddingBottom = 20, this.Url})
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
        child: ElevatedButton(
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),

        // OutlinedButton(
        //   onPressed: null, // onPressed отключен, обработка через GestureDetector
        //   child: Text('$text'.toUpperCase()),
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: Colors.red,
        //     textStyle: TextStyle(
        //       fontFamily: 'Roboto',
        //       fontSize: 13,
        //       fontWeight: FontWeight.w900,
        //     ),
        //     side: BorderSide(color: Colors.black, width: 2),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //     padding: EdgeInsets.all(16), // Внутренний отступ
        //   ),
        // ),
      ),
    );
  }
}
