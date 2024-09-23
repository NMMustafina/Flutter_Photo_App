import 'package:flutter/material.dart';
import 'package:photo_app/widgets/image_full.dart';

class ImageSmall extends StatelessWidget {
  final String imageUrl;
  final double? imageWidth;
  final double imageHeight;
  final String pathAvatar;
  final String textUsername;
  final String textLogin;

  const ImageSmall(
      {Key? key,
      required this.imageUrl,
      this.imageWidth,
      required this.imageHeight,
      required this.pathAvatar,
      required this.textUsername,
      required this.textLogin,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Если imageWidth не передан, то ширина по умолчанию - ширина экрана
    final double defaultWidth = imageWidth ?? MediaQuery.sizeOf(context).width;

    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageFull(
                imageUrl: imageUrl,
                pathAvatar: pathAvatar,
                textUsername: textUsername,
                textLogin: textLogin,
              ),
            ),
          );
        },
        child: Image.asset(
          imageUrl,
          width: defaultWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
