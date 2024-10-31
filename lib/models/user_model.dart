import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String accountName;
  final String firstName;
  final String? lastName;
  final String? location;
  final String? avatar;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.accountName,
    required this.firstName,
    this.lastName,
    this.location,
    this.avatar,
    required this.createdAt,
  });

  // Метод для создания модели из JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // Метод для преобразования модели в JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
