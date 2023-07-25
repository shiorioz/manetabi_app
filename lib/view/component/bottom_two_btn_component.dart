import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/style.dart';

import '../../constant/colors.dart';

class BottomTwoBtnComp extends StatelessWidget implements PreferredSizeWidget {
  final String leftBtnText;
  final String rightBtnText;
  final IconData leftIcon;
  final IconData rightIcon;
  final Function() leftOnPressed;
  final Function() rightOnPressed;

  const BottomTwoBtnComp(BuildContext context,
      {super.key,
      required this.leftBtnText,
      required this.rightBtnText,
      required this.leftIcon,
      required this.rightIcon,
      required this.leftOnPressed,
      required this.rightOnPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            icon: Icon(leftIcon, color: ColorConst.darkGrey, size: 22),
            label: Text(
              leftBtnText,
              style: const TextStyle(
                fontSize: 24,
                color: ColorConst.darkGrey,
                fontFamily: StyleConst.customFont,
                letterSpacing: 1.6,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.jungleMint,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
            ),
            onPressed: leftOnPressed,
          ),
          const SizedBox(width: 20),
          ElevatedButton.icon(
            icon: Icon(rightIcon, color: ColorConst.darkGrey, size: 22),
            label: Text(
              rightBtnText,
              style: const TextStyle(
                fontSize: 24,
                color: ColorConst.darkGrey,
                fontFamily: StyleConst.customFont,
                letterSpacing: 1.6,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.grey,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
            ),
            onPressed: leftOnPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
