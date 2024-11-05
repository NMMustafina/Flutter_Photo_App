import 'user_model.dart'; // Импортируем существующую модель UserModel

class ImageModel {
  final int id;
  final String imageLink;
  final UserModel user;
  final List<String> tags;
  final DateTime createdAt;

  ImageModel({
    required this.id,
    required this.imageLink,
    required this.user,
    required this.tags,
    required this.createdAt,
  });

  // Создание экземпляра из JSON
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      imageLink: json['imageLink'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>), // Используем UserModel
      tags: List<String>.from(json['tags'] as List), // Преобразуем теги в List<String>
      createdAt: DateTime.parse(json['createdAt'] as String), // Парсим дату
    );
  }

  // Преобразование экземпляра в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageLink': imageLink,
      'user': user.toJson(), // Преобразуем UserModel в JSON
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'ImageModel{id: $id, imageLink: $imageLink, user: $user, tags: $tags, createdAt: $createdAt}';
  }
}
