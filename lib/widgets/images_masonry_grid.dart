import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';

class ImagesMasonryGrid extends StatelessWidget {
  final List<ImageModel> imagesData;
  final bool imageDataLastPage;
  final VoidCallback onEndReached;

  const ImagesMasonryGrid(
      {super.key,
      required this.imagesData,
      required this.imageDataLastPage,
      required this.onEndReached});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap:
                  true, // займет место только для элементов, а не всё доступное пространство
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: imagesData.length,
              itemBuilder: (context, index) {
                return ImageSmall(
                  imageUrl: imagesData[index].imageLink,
                  avatar: imagesData[index].user.avatar ??
                      'assets/images/default-avatar.webp',
                  fullName:
                      '${imagesData[index].user.firstName} ${imagesData[index].user.lastName ?? ''}',
                  accountName: imagesData[index].user.accountName,
                );
              },
            ),
          ),
          PrimaryOutlinedButton(
            textButton: 'See More',
            onPressed: imageDataLastPage
                ? null // Если условие истинно, кнопка отключается
                : () {
                    onEndReached();
                  },
          ),
        ],
      ),
    );
  }
}
