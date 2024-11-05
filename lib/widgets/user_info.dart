import 'package:flutter/material.dart';
import 'package:photo_app/screens/profile_screen.dart';

class UserInfo extends StatelessWidget {
  final String avatar;
  final String fullName;
  final String accountName;
  final Color textColor;

  const UserInfo(
      {super.key,
      required this.avatar,
      required this.fullName,
      required this.accountName,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(accountName: accountName),
          ),
        );
      },
      mouseCursor: SystemMouseCursors.click,
      child: Row(
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
                  avatar,
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
                  fullName,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  accountName,
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
      ),
    );
  }
}
