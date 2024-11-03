class AccountUpdateRequest {
  final String password;
  final String firstName;
  final String? lastName;
  final String? location;
  final String? avatar;

  AccountUpdateRequest({
    required this.password,
    required this.firstName,
    this.lastName,
    this.location,
    this.avatar,
  });

  // Метод для создания экземпляра из JSON
  factory AccountUpdateRequest.fromJson(Map<String, dynamic> json) {
    return AccountUpdateRequest(
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      location: json['location'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  // Метод для преобразования экземпляра в JSON
  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'avatar': avatar,
    };
  }
}
