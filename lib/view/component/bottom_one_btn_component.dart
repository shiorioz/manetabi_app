import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ButtomOneBtnComp extends StatelessWidget implements PreferredSizeWidget {
  final String btnText;

  const ButtomOneBtnComp(BuildContext context, {required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                foregroundColor: ColorConst.black,
                backgroundColor: ColorConst.grey,
              ),
              onPressed: () {},
              child: Text(btnText, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
