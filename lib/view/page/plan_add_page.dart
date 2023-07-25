import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/view/component/bottom_two_btn_component.dart';
import 'package:manetabi_app/view/component/menubar_component.dart';

import '../../constant/style.dart';

class PlanAddPage extends StatefulWidget {
  const PlanAddPage({super.key});

  @override
  State<PlanAddPage> createState() => _PlanAddPageState();
}

class _PlanAddPageState extends State<PlanAddPage> {
  var _startLabelText = 'YYYY/MM/DD';
  var _endLabelText = 'YYYY/MM/DD';
  String costText = '0';

  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2016),
      lastDate: DateTime.now().add(const Duration(days: 360)),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light()
                  .copyWith(primary: ColorConst.darkGrey),
            ),
            child: child!);
      },
    );

    if (picked != null) {
      setState(() {
        _date = picked;
        if (isStart) {
          _startLabelText = DateFormat('yyyy/MM/dd').format(_date);
        } else {
          _endLabelText = DateFormat('yyyy/MM/dd').format(_date);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenubarComp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _inputDetailWidget(context),
            const SizedBox(height: 20),
            _inputBlockWidget(context),
            const SizedBox(height: 20),
            BottomTwoBtnComp(
              context,
              leftBtnText: StringConst.keepText,
              rightBtnText: StringConst.deleteText,
              leftIcon: FontAwesomeIcons.solidCircleDown,
              rightIcon: FontAwesomeIcons.trash,
              leftOnPressed: () {},
              rightOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // 詳細部分ウィジェット
  Widget _inputDetailWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // title入力
            // TODO: 下線の太さ
            const TextField(
              decoration: InputDecoration(
                hintText: StringConst.titleText,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConst.darkGrey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConst.darkGrey,
                  ),
                ),
              ),
            ),
            // 場所入力
            const TextField(
              decoration: InputDecoration(
                hintText: StringConst.placeText,
                icon: Icon(FontAwesomeIcons.locationDot,
                    color: ColorConst.darkGrey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 開始日付入力
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('start', style: TextStyle(fontSize: 20)),
                    ElevatedButton(
                      onPressed: () => _selectDate(context, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: ColorConst.darkGrey)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      child: Row(
                        children: [
                          Text(_startLabelText,
                              style: const TextStyle(
                                  fontSize: 14, color: ColorConst.darkGrey)),
                          const SizedBox(width: 10),
                          const Icon(FontAwesomeIcons.solidCalendarDays,
                              size: 20, color: ColorConst.darkGrey),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: Text('-'),
                ),

                // 終了日付入力
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(StringConst.endText,
                        style: TextStyle(fontSize: 20)),
                    ElevatedButton(
                      onPressed: () => _selectDate(context, false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: ColorConst.darkGrey)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      child: Row(
                        children: [
                          Text(_endLabelText,
                              style: const TextStyle(
                                  fontSize: 16, color: ColorConst.darkGrey)),
                          const SizedBox(width: 10),
                          const Icon(FontAwesomeIcons.solidCalendarDays,
                              size: 20, color: ColorConst.darkGrey),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            //  メンバー入力
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.users,
                      size: 20, color: ColorConst.darkGrey),
                  SizedBox(width: 14),
                  Text(StringConst.memberText, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Center(child: Text(StringConst.memberSearchText)),
                  labelStyle: TextStyle(
                    color: ColorConst.darkGrey,
                    fontSize: 20,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorConst.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.sackDollar,
                      size: 20, color: ColorConst.darkGrey),
                  SizedBox(width: 14),
                  Text(StringConst.budgetText, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Center(child: Text('$costText￥')),
                  labelStyle: const TextStyle(
                    color: ColorConst.darkGrey,
                    fontSize: 20,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorConst.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ブロック入力ウィジェット
  Widget _inputBlockWidget(BuildContext context) {
    return Container(
      child: Text('block'),
    );
  }
}
