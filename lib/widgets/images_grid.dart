import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_app/widgets/image_small.dart';

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: MasonryGridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return [
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_01.png',
                    imageHeight: 220,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_02.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_03.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_04.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_05.png',
                    imageHeight: 220,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_06.png',
                    imageHeight: 220,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_07.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_08.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_09.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/browse_all/image_10.png',
                    imageHeight: 220,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
            ][index]();
          },
        ),
      ),
    );
  }
}
