import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/constant/style.dart';

import '../../constant/strings.dart';

class AppbarComp extends StatelessWidget implements PreferredSizeWidget {
  const AppbarComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: ColorConst.jungleMint,
      title: const Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Text(
          StringConst.appName,
          style: TextStyle(
            color: ColorConst.darkGrey,
            fontSize: 32,
            fontFamily: StyleConst.customFont,
            letterSpacing: 1.4,
            shadows: [
              Shadow(
                color: ColorConst.white,
                offset: Offset(3, 2),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                color: ColorConst.white,
                shadows: [
                  Shadow(
                    color: ColorConst.shadowGrey,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
