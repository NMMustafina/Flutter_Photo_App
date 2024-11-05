import 'package:flutter/material.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';

class ImagesLoadMoreGrid extends StatefulWidget {
  const ImagesLoadMoreGrid({super.key});

  @override
  State<ImagesLoadMoreGrid> createState() => _ImagesLoadMoreGridState();
}

class _ImagesLoadMoreGridState extends State<ImagesLoadMoreGrid> {
  final List<String> _imageUrls = List.generate(
      5, (index) => 'assets/images/search_results/image_${index + 1}.png');

  void _loadMoreImages() {
    setState(() {
      int currentLength = _imageUrls.length;
      List<String> newImages = List.generate(
          5,
          (index) =>
              'assets/images/search_results/image_${currentLength + index + 1}.png');
      _imageUrls.addAll(newImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              return ImageSmall(
                imageUrl: _imageUrls[index],
                imageHeight: 220,
                avatar: 'assets/images/avatar/avatar_06.png',
                fullName: 'Angelo Pantazis',
                accountName: '@angelopantazis',
              );
            },
          ),
        ),
        PrimaryOutlinedButton(
          textButton: 'See More',
          onPressed: _loadMoreImages,
        ),
      ],
    );
  }
}
