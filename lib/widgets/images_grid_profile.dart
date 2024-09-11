import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_app/widgets/image_small.dart';

class ImagesGridProfile extends StatelessWidget {
  const ImagesGridProfile({
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
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return [
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_01.png',
                    imageHeight: 220,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_02.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_03.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_04.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_05.png',
                    imageHeight: 310,
                    pathAvatar: 'assets/images/avatar/avatar_06.png',
                    textUsername: 'Angelo Pantazis',
                    textLogin: '@angelopantazis',
                  ),
              () => ImageSmall(
                    imageUrl: 'assets/images/profile/image_06.png',
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
