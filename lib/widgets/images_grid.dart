import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_app/widgets/image_small.dart';
import 'package:photo_app/widgets/primary_button.dart';

class ImagesGrid extends StatelessWidget {
  final String? userId;
  final String? category;

  ImagesGrid({this.userId, this.category});

  @override
  Widget build(BuildContext context) {
    // Функция для получения списка изображений
    Future<List<String>> getUserImages(String? userId) async {
      Query query = FirebaseFirestore.instance.collection('images');

      // Если userId не null, добавляем фильтрацию по userId
      if (userId != null) {
        query = query.where('userId', isEqualTo: userId);
      } else

      // Если category не null, добавляем фильтрацию по category
      if (category != null) {
        query = query.where('category', isEqualTo: category);
      }

      // Выполняем запрос
      QuerySnapshot querySnapshot = await query.get();

      // Извлекаем все ссылки на изображения
      List<String> imageLinks =
          querySnapshot.docs.map((doc) => doc['imageLink'] as String).toList();

      return imageLinks;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: FutureBuilder<List<String>>(
              future: getUserImages(userId),
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Нет изображений'));
                }

                // Отображаем изображения в сетке MasonryGridView
                return MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap:
                      true, // займет место только для элементов, а не всё доступное пространство
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ImageSmall(
                      imageUrl: snapshot.data![index],
                      pathAvatar: 'assets/images/avatar/avatar_06.png',
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
