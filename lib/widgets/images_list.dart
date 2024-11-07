import 'package:flutter/material.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/widgets/image_card.dart';

class ImagesList extends StatelessWidget {
  final List<ImageModel> imagesData;

  const ImagesList({super.key, required this.imagesData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 37),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: imagesData.length,
          itemBuilder: (context, index) {
            return ImageCard(
              imageLink: imagesData[index].imageLink,
              avatar: imagesData[index].user.avatar ??
                  'assets/images/default-avatar.webp',
              fullName:
                  '${imagesData[index].user.firstName} ${imagesData[index].user.lastName ?? ''}',
              accountName: imagesData[index].user.accountName,
            );
          },
        ),
      ),
    );
  }
}
