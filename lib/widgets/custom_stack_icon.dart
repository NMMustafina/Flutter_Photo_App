import 'package:flutter/material.dart';

class CustomStackIcon extends StatelessWidget {
  const CustomStackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF00D6),
                Color(0xFFFF4D00),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}
