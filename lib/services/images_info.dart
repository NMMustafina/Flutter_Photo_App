import 'package:cloud_firestore/cloud_firestore.dart';

// Функция для получения изображений и данных пользователей
Future<List<Map<String, dynamic>>> getImagesWithUserInfo(String? userId, String? category) async {
  List<Map<String, dynamic>> imagesWithUserInfo = [];

  // Запрос к коллекции images
  //QuerySnapshot imageSnapshot = await FirebaseFirestore.instance.collection('images').get();

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

  // Проходим по каждому документу в images
  for (var imageDoc in querySnapshot.docs) {
    String userId = imageDoc['userId'];

    // Запрос к коллекции users для получения данных пользователя по userId
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    // Добавляем данные изображения и пользователя в список
    imagesWithUserInfo.add({
      'imageLink': imageDoc['imageLink'],
      'avatar': userSnapshot['avatar'],
      'username': userSnapshot['username'],
      'login': userSnapshot['login'],
    });
  }

  return imagesWithUserInfo;
}