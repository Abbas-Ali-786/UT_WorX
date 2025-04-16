class UserModel {
  final String email;
  final String password;
  final String uid;
  final String role;

  UserModel({
    required this.email,
    required this.password,
    required this.uid,
    required this.role,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      uid: json['uid'] ?? '',
      role: json['role'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'uid': uid,
      'role': role,
    };
  }
}
