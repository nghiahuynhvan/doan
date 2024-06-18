class RegisterModel {
  final String username;
  final String password;
  final String email;
  final String fullName;

  RegisterModel({
    required this.username,
    required this.password,
    required this.email,
    required this.fullName,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'fullName': fullName,
    };
  }
}