import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_app/services/images_info.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';

class ImagesGrid extends StatelessWidget {
  final String? userId;
  final String? category;

  const ImagesGrid({super.key, this.userId, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32),
            // child: FutureBuilder<List<Map<String, dynamic>>>(
            //   future: getImagesWithUserInfo(userId, category),
            //   builder: (context,
            //       AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(
            //           child: CircularProgressIndicator(
            //         valueColor: AlwaysStoppedAnimation(Colors.black),
            //       ));
            //     }
            //
            //     if (snapshot.hasError) {
            //       return Center(child: Text('Ошибка: ${snapshot.error}'));
            //     }
            //
            //     if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('Нет изображений'));
            //     }
            //
            //     // Отображаем изображения в сетке MasonryGridView
            //     return MasonryGridView.count(
            //       physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap:
            //           true, // займет место только для элементов, а не всё доступное пространство
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10,
            //       crossAxisSpacing: 10,
            //       itemCount: snapshot.data!.length,
            //       itemBuilder: (context, index) {
            //         final imageData = snapshot.data![index];
            //         return ImageSmall(
            //           imageUrl: imageData['imageLink'],
            //           avatar: imageData['avatar'],
            //           fullName: imageData['username'],
            //           accountName: imageData['login'],
            //         );
            //       },
            //     );
            //   },
            // ),
          ),
          PrimaryOutlinedButton(
            textButton: 'See More',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
