import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
Imageimport 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/primary_button.dart';

class ImagesGrid extends StatefulWidget {
  final String userID;

  ImagesGrid({required this.userID});

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  // Функция для получения списка ссылок на изображения пользователя
  Future<List<String>> getUserImages(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('images')
        .where('userID', isEqualTo: userID)
        .get();

    // Извлекаем все ссылки на изображения
    List<String> imageLinks =
    querySnapshot.docs.map((doc) => doc['imageLink'] as String).toList();
    return imageLinks;
  }



  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: FutureBuilder<List<String>>(
                future: getUserImages(widget.userID),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black,
                          ),
                        ),
                      ),
                    );
                  }

                  List<String> imageLinkList = snapshot.data!;
                  return MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap:
                    true, // займет место только для элементов, а не всё доступное пространство
                    gridDelegate:
                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: imageLinkList.length,
                    itemBuilder: (context, index) {
                      final imageLink = imageLinkList[index];
                      return ImageSmall(
                        imageUrl:
                        imageLink,
                        pathAvatar:
                        'assets/images/avatar/avatar_06.png',
                        textUsername: 'Angelo Pantazis',
                        textLogin: '@angelopantazis',
                      );
                    },
                  );
                },
              ),
            ),
            PrimaryButton(
              textButton: 'See More',
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      );
  }
}