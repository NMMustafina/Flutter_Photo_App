import 'package:flutter/material.dart';

class EndDrawerPrimaryButton extends StatelessWidget {
  final String title;
  final String routeName;

  const EndDrawerPrimaryButton(
      {super.key, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              foregroundColor: Colors.black,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
