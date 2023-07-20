import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manetabi_app/model/users_model.dart';

class AuthController {
  late UserModel _user;
  // bool _isLoggedIn = false;

  // String get username => _user.user_name;
  // String get email => _user.email;
  // String get password => _user.password;
  // String get registration_date => _user.registration_date;
  // String? get profile_image_path => _user.profile_image_path;
  // String get created_at => _user.created_at;
  // String get updated_at => _user.updated_at;

  void setUser(UserModel user, VoidCallback setStateCallback) {
    _user = user;
    setStateCallback();
  }

  // TODO: ログイン処理
  Future<void> login(VoidCallback setStateCallback) async {
    setStateCallback();

    bool isValid = _isValidCredential(_user.email, _user.password);
    setStateCallback();

    if (isValid) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
    }
  }

  // email, passwordが一致するかどうか
  bool _isValidCredential(String email, String password) {
    return true;
  }

  // apiからユーザー情報を取得

  // ログイン済みかどうかを取得
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
