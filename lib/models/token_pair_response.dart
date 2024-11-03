class TokenPairResponse {
  final String accessToken;
  final String refreshToken;

  TokenPairResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  // Фабричный конструктор для создания модели из JSON
  factory TokenPairResponse.fromJson(Map<String, dynamic> json) {
    return TokenPairResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  // Метод для преобразования модели в JSON
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
