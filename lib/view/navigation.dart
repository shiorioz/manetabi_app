import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/view/component/appbar_component.dart';
import 'package:manetabi_app/view/page/bookmark_page.dart';
import 'package:manetabi_app/view/page/home_page.dart';
import 'package:manetabi_app/view/page/plan_add_page.dart';
import 'package:manetabi_app/view/page/plan_copy_page.dart';
import 'package:manetabi_app/view/page/profile_page.dart';
import 'package:manetabi_app/view/page/search_page.dart';

import '../constant/strings.dart';

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
        mainActionButtonTheme: const MainActionButtonTheme(
          color: ColorConst.white,
          icon: Icon(
            FontAwesomeIcons.plus,
            color: ColorConst.jungle_mint,
          ),
        ),
        bottomBarTheme: const BottomBarTheme(
          heightOpened: 280,
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: ColorConst.jungle_mint,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          itemIconColor: ColorConst.white,
          selectedItemIconColor: ColorConst.dark_grey,
          itemIconSize: 24.0,
          selectedItemIconSize: 26.0,
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
          // TODO: 影をつける
          BottomBarWithSheetItem(
            icon: Icons.home,
          ),
          BottomBarWithSheetItem(icon: Icons.search),
          BottomBarWithSheetItem(icon: Icons.bookmark),
          BottomBarWithSheetItem(icon: Icons.person),
        ],
      ),
    );
  }

  Widget _addPlanWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanAddPage(),
                    ));
              },
              child: const SizedBox(
                width: 160,
                height: 160,
                child: Center(
                    child: Text(StringConst.addPlan,
                        style: TextStyle(fontSize: 20))),
              ),
            ),
          ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlanCopyPage(),
                    ));
              },
              child: const SizedBox(
                width: 160,
                height: 160,
                child: Center(
                    child: Text(StringConst.copyPlan,
                        style: TextStyle(fontSize: 20))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
