class UserModel {
  final String email;
  final String password;
  final String role;

  UserModel({
    required this.email,
    required this.password,
    required this.role,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
