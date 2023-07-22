class UserModel {
  final String userId;
  final String userName;
  final String email;
  final String password;
  final String registrationDate;
  final String? profileImagePath;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.registrationDate,
    this.profileImagePath,
    required this.createdAt,
    required this.updatedAt,
  });
}
