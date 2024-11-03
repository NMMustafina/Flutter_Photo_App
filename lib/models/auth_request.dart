class AuthRequest {
  final String username;
  final String password;

  AuthRequest({
    required this.username,
    required this.password,
  });

  // Фабричный конструктор для создания модели из JSON
  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return AuthRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  // Метод для преобразования модели в JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
