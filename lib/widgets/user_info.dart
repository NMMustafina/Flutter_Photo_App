import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String pathAvatar;
  final String textUsername;
  final String textLogin;
  final Color textColor;

  const UserInfo(
      {super.key,
      required this.pathAvatar,
      required this.textUsername,
      required this.textLogin,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                pathAvatar,
              ).image,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textUsername,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                textLogin,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 11,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
