import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/view/navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // bool? _isLoggedIn;

  // @override
  // void initState() {
  //   super.initState();
  //   Future() async {
  //     // _isLoggedIn = await AuthController().isLoggedIn();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: ColorConst.grey,
        ),
      ),
      // home: _isLoggedIn == true ? Navigation() : LoginPage(),
      home: const Navigation(),
    );
  }
}
