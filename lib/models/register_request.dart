class RegisterRequest {
  final String username;
  final String password;
  final String accountName;
  final String firstName;
  final String? lastName;
  final String? location;
  final String? avatar;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.accountName,
    required this.firstName,
    this.lastName,
    this.location,
    this.avatar,
  });

  // Фабричный конструктор для создания модели из JSON
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      username: json['username'] as String,
      password: json['password'] as String,
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
      'username': username,
      'password': password,
      'accountName': accountName,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'avatar': avatar,
    };
  }
}
