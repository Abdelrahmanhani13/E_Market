class UserModel {
  final String userId;
  final String email;
  final String? name;

  UserModel({
    required this.userId,
    required this.email,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
