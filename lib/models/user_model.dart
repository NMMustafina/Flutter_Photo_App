class UserModel {
  final int id;
  final String username;
  final String accountName;
  final String firstName;
  final String? lastName;
  final String? location;
  final String? avatar;

  UserModel({
    required this.id,
    required this.username,
    required this.accountName,
    required this.firstName,
    this.lastName,
    this.location,
    this.avatar,
  });

  // Фабричный конструктор для создания модели из JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      accountName: json['accountName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      location: json['location'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  // Метод для преобразования модели в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'accountName': accountName,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, username: $username, accountName: $accountName, firstName: $firstName, lastName: $lastName, location: $location, avatar: $avatar}';
  }
}
