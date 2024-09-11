import 'package:flutter/material.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/user_info.dart';

class ImageCard extends StatelessWidget {
  final String pathImageCard;
  final String pathAvatar;
  final String textUsername;
  final String textLogin;

  const ImageCard(
      {Key? key,
      required this.pathImageCard,
      required this.pathAvatar,
      required this.textUsername,
      required this.textLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
          child: ImageSmall(
            imageUrl: pathImageCard,
            imageWidth: MediaQuery.sizeOf(context).width - 32,
            imageHeight: 343,
            pathAvatar: pathAvatar,
            textUsername: textUsername,
            textLogin: textLogin,
          ),
        ),
        UserInfo(
          pathAvatar: pathAvatar,
          textUsername: textUsername,
          textLogin: textLogin,
        ),
      ],
    );
  }
}
