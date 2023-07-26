import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';

class IconBtnComponent extends StatelessWidget implements PreferredSizeWidget {
  final String btnText;
  final IconData icon;
  final Function() onPressed;

  const IconBtnComponent(BuildContext context,
      {super.key,
      required this.btnText,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, color: ColorConst.darkGrey, size: 24),
              label: Text(
                btnText,
                style: const TextStyle(
                  fontSize: 24,
                  color: ColorConst.darkGrey,
                  fontFamily: StyleConst.customFont,
                  letterSpacing: 1.6,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.schoolbusYellow,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
