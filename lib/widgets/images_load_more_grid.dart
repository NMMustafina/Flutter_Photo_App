import 'package:flutter/material.dart';
import 'package:photo_app/widgets/button_white.dart';
import 'package:photo_app/widgets/image_small.dart';

class ImagesLoadMoreGrid extends StatefulWidget {
  @override
  _ImagesLoadMoreGridState createState() => _ImagesLoadMoreGridState();
}

class _ImagesLoadMoreGridState extends State<ImagesLoadMoreGrid> {
  List<String> _imageUrls = List.generate(
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
        Container(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              return ImageSmall(
                imageUrl: '${_imageUrls[index]}',
                imageHeight: 220,
                pathAvatar: 'assets/images/avatar/avatar_06.png',
                textUsername: 'Angelo Pantazis',
                textLogin: '@angelopantazis',
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonWhite(
            textButton: 'See More',
            Url: _loadMoreImages,
          ),
          //ElevatedButton(
          //onPressed: _loadMoreImages,
          //child: Text('See More'),
        ),
      ],
    );
  }
}
