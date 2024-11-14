import 'package:flutter/material.dart';
import 'package:photo_app/widgets/widgets.dart';

class ImageCard extends StatelessWidget {
  final String imageLink;
  final String avatar;
  final String fullName;
  final String accountName;

  const ImageCard(
      {super.key,
      required this.imageLink,
      required this.avatar,
      required this.fullName,
      required this.accountName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
          child: ImageSmall(
            imageUrl: imageLink,
            imageWidth: MediaQuery.sizeOf(context).width - 32,
            imageHeight: 343,
            avatar: avatar,
            fullName: fullName,
            accountName: accountName,
          ),
        ),
        UserInfo(
          avatar: avatar,
          fullName: fullName,
          accountName: accountName,
        ),
      ],
    );
  }
}
