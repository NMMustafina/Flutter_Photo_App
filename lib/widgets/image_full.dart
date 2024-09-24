import 'package:flutter/material.dart';
import 'package:photo_app/widgets/user_info.dart';

class ImageFull extends StatelessWidget {
  final String imageUrl;
  final String pathAvatar;
  final String textUsername;
  final String textLogin;

  ImageFull(
      {required this.imageUrl,
      required this.pathAvatar,
      required this.textUsername,
      required this.textLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color(0x00C4C4C4)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 46, 25, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfo(
                    pathAvatar: pathAvatar,
                    textUsername: textUsername,
                    textLogin: textLogin,
                    textColor: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
