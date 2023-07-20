import 'package:flutter/material.dart';
import 'package:manetabi_app/controller/auth_controller.dart';
import 'package:manetabi_app/view/navigation.dart';
import 'package:manetabi_app/view/page/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    Future() async {
      _isLoggedIn = await AuthController().isLoggedIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isLoggedIn == true ? Navigation() : LoginPage(),
    );
  }
}
