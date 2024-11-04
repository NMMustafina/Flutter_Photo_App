class CreateImageRequest {
  final String imageLink;
  final List<String> tags;

  CreateImageRequest({
    required this.imageLink,
    required this.tags,
  });

  // Фабричный конструктор для создания модели из JSON
  factory CreateImageRequest.fromJson(Map<String, dynamic> json) {
    return CreateImageRequest(
      imageLink: json['imageLink'] as String,
      tags: List<String>.from(json['tags'] as List),
    );
  }

  // Метод для преобразования модели в JSON
  Map<String, dynamic> toJson() {
    return {
      'imageLink': imageLink,
      'tags': tags,
    };
  }
}
