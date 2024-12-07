import 'package:flutter/material.dart';
import 'package:photo_app/screens/screens.dart';
import 'package:photo_app/theme/styling.dart';

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
        Navigator.pop(context);
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
                  style: b13Bold.copyWith(color: textColor),
                ),
                Text(
                  accountName,
                  style: b11Regular.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
