class LoginResponseDTO{
  late int? statusCode;
  late String? errorMessage;
  late String? userId;
  late String? username;

  LoginResponseDTO({
    required this.statusCode,
    required this.errorMessage,
    required this.userId,
    required this.username
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) {
    return LoginResponseDTO(
      statusCode: json['StatusCode'] as int?,
      errorMessage: json['ErrorMessage'] as String?,
      userId: json['UserID'] as String?,
      username: json['Username'] as String?,
    );
  }
}