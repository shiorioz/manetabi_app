import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/view/component/menubar_component.dart';

class PlanAddPage extends StatefulWidget {
  const PlanAddPage({super.key});

  @override
  State<PlanAddPage> createState() => _PlanAddPageState();
}

class _PlanAddPageState extends State<PlanAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenubarComp(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _inputDetailWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  // 詳細部分ウィジェット
  Widget _inputDetailWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            // TODO: 下線の太さ
            TextField(
              decoration: InputDecoration(
                hintText: 'title',
                contentPadding: EdgeInsets.all(10),
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
          ],
        ),
      ),
    );
  }

  // 編集ボタンウィジェット
  Widget _buttonWidget(BuildContext context) {
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
              child: const Text('保存', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: 20),
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
              child: const Text('削除', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
