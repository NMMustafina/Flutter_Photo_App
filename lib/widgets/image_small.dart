import 'package:flutter/material.dart';
import 'package:photo_app/widgets/widgets.dart';

class ImageSmall extends StatelessWidget {
  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final String avatar;
  final String fullName;
  final String accountName;

  const ImageSmall(
      {super.key,
      required this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      required this.avatar,
      required this.fullName,
      required this.accountName,
      });

  @override
  Widget build(BuildContext context) {
    // Если imageWidth не передан, то ширина по умолчанию - ширина экрана
    final double defaultWidth = imageWidth ?? MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageFull(
              imageUrl: imageUrl,
              avatar: avatar,
              fullName: fullName,
              accountName: accountName,
            ),
          ),
        );
      },
      child: Image.network(
        imageUrl,
        width: defaultWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
