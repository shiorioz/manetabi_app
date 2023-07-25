import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';

class IconBtnComponent extends StatelessWidget implements PreferredSizeWidget {
  final String btnText;
  final IconData icon;

  const IconBtnComponent(BuildContext context,
      {super.key, required this.btnText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
            //     elevation: 0,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(24),
            //     ),
            //     foregroundColor: ColorConst.dark_grey,
            //     backgroundColor: ColorConst.schoolbus_yellow,
            //   ),
            //   onPressed: () {},
            //   child: Text(btnText, style: TextStyle(fontSize: 20)),
            // ),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: 検索処理
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
              },
              // iconがnullじゃなかったらiconを表示
              icon: Icon(icon, color: ColorConst.dark_grey, size: 24),
              label: Text(
                btnText,
                style: const TextStyle(
                  fontSize: 24,
                  color: ColorConst.dark_grey,
                  fontFamily: StyleConst.customFont,
                  letterSpacing: 1.6,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.schoolbus_yellow,
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
