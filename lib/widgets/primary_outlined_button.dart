import 'package:flutter/material.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  final String textButton;
  final double? paddingBottom;
  final Function()? onPressed;

  const PrimaryOutlinedButton(
      {super.key,
      required this.textButton,
      this.paddingBottom,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 20),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return Colors.black;
            },
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey[200];
              }
              return null; // Без эффекта для других состояний
            },
          ),
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
          side: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return const BorderSide(color: Colors.grey, width: 2);
              }
              return const BorderSide(color: Colors.black, width: 2);
            },
          ),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        child: Text(textButton.toUpperCase()),
      ),
    );
  }
}
