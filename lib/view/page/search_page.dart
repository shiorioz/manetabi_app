import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/constant/style.dart';
import 'package:manetabi_app/view/component/icon_btn_component.dart';

import '../../constant/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              _searchWidget(),
              const SizedBox(height: 20),
              IconBtnComponent(context,
                  btnText: StringConst.searchBtnText,
                  icon: FontAwesomeIcons.magnifyingGlass),
            ],
          ),
        ),
      ),
    );
  }

  // 検索ウィジェット
  Widget _searchWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: ColorConst.jungle_mint,
        borderRadius: BorderRadius.circular(45),
        boxShadow: const [
          BoxShadow(
              blurRadius: 2,
              color: ColorConst.shadow_grey,
              spreadRadius: 0.5,
              offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 36),
        child: Column(
          children: [
            // キーワード検索
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 2,
                      color: ColorConst.shadow_grey,
                      spreadRadius: 0.5,
                      offset: Offset(0, 3)),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'keyword',
                  labelStyle: TextStyle(
                    color: ColorConst.dark_grey,
                    fontSize: 22,
                    fontFamily: StyleConst.customFont,
                    letterSpacing: 1.2,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fillColor: ColorConst.sub_yellow,
                  filled: true,
                  prefixIcon: Icon(FontAwesomeIcons.key),
                  prefixIconColor: ColorConst.dark_grey,
                ),
              ),
            ),
            // 場所
            _searchBoxWidget(
              title: StringConst.placeTitle,
              icon: FontAwesomeIcons.locationDot,
              contents: [],
            ),
            // 季節
            _searchBoxWidget(
              title: StringConst.seasonTitle,
              icon: FontAwesomeIcons.tree,
              contents: [],
            ),
            // 日数
            _searchBoxWidget(
              title: StringConst.dayTitle,
              icon: FontAwesomeIcons.calendarDays,
              contents: [],
            ),
            // タグ
            _searchBoxWidget(
              title: StringConst.tagTitle,
              icon: FontAwesomeIcons.tag,
              contents: [],
            ),
            // 予算
            _searchBoxWidget(
              title: StringConst.costTitle,
              icon: FontAwesomeIcons.sackDollar,
              contents: [],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _btnWidget() {
  //   return ElevatedButton.icon(
  //     onPressed: () {
  //       // TODO: 検索処理
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
  //     },
  //     icon: const Icon(
  //       FontAwesomeIcons.magnifyingGlass,
  //       color: ColorConst.dark_grey,
  //     ),
  //     label: const Text(
  //       'search',
  //       style: TextStyle(
  //         fontSize: 24,
  //         color: ColorConst.dark_grey,
  //         fontFamily: StyleConst.customFont,
  //         letterSpacing: 1.6,
  //       ),
  //     ),
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: ColorConst.schoolbus_yellow,
  //       elevation: 2,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
  //     ),
  //   );
  // }

  Widget _searchBoxWidget(
      {required String title, required icon, required List<Widget> contents}) {
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ColorConst.dark_grey, width: 2)),
            ),
            child: ExpansionTile(
              trailing: const Icon(FontAwesomeIcons.sortDown),
              iconColor: ColorConst.dark_grey,
              title: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 20),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.dark_grey)),
                ],
              ),
              children: contents,
            ),
          ),
        ],
      ),
    );
  }
}
