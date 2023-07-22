import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/view/component/appbar_component.dart';
import 'package:manetabi_app/view/page/bookmark_page.dart';
import 'package:manetabi_app/view/page/home_page.dart';
import 'package:manetabi_app/view/page/profile_page.dart';
import 'package:manetabi_app/view/page/search_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
  }

  static const _pages = [
    HomePage(),
    SearchPage(),
    BookmarkPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComp(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          itemIconColor: ColorConst.grey,
          selectedItemIconColor: ColorConst.dark_grey,
          itemIconSize: 24.0,
          selectedItemIconSize: 24.0,
          // selectedItemIconSize: 30.0,
          // なぜか効かない
          // itemTextStyle: TextStyle(
          //   color: Colors.grey,
          //   fontSize: 14.0,
          // ),
          // selectedItemTextStyle: TextStyle(
          //   color: Colors.red,
          //   fontSize: 14.0,
          // ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        sheetChild: Center(
          child: _addPlanWidget(),
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.home),
          BottomBarWithSheetItem(icon: Icons.search),
          BottomBarWithSheetItem(icon: Icons.bookmark),
          BottomBarWithSheetItem(icon: Icons.person),
        ],
      ),
    );
  }

  Widget _addPlanWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.grey,
                foregroundColor: ColorConst.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                '新規作成',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 180,
          height: 180,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.grey,
              foregroundColor: ColorConst.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'コピーして作成',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
