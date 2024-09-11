import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String pathAvatar;
  final String textUsername;
  final String textLogin;
  final Color textColor;

  const UserInfo(
      {Key? key,
      required this.pathAvatar,
      required this.textUsername,
      required this.textLogin,
      this.textColor = Colors.black})
      : super(key: key);

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
              image: Image.asset(
                pathAvatar,
              ).image,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
