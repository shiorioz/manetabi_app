import 'package:flutter/material.dart';

import '../../constant/strings.dart';

class AppbarComp extends StatelessWidget implements PreferredSizeWidget {
  const AppbarComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        Strings.appName.toUpperCase(),
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
