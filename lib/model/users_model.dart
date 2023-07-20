class UserModel {
  final String user_id;
  final String user_name;
  final String email;
  final String password;
  final String registration_date;
  final String? profile_image_path;
  final String created_at;
  final String updated_at;

  UserModel({
    required this.user_id,
    required this.user_name,
    required this.email,
    required this.password,
    required this.registration_date,
    this.profile_image_path,
    required this.created_at,
    required this.updated_at,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json['user_id'],
      user_name: json['user_name'],
      email: json['email'],
      password: json['password'],
      registration_date: json['registration_date'],
      profile_image_path: json['profile_image_path'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
      'registration_date': registration_date,
      'profile_image_path': profile_image_path,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}

// class User with _$User {
//   const factory User({
//     required user_id,
//     required user_name,
//     required email,
//     required password,
//     required registration_date,
//     profile_image_path,
//     required created_at,
//     required updated_at,
//   }) = _User;
// }
