import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/view/component/menubar_component.dart';

class PlanAddPage extends StatefulWidget {
  PlanAddPage({super.key});

  @override
  State<PlanAddPage> createState() => _PlanAddPageState();
}

class _PlanAddPageState extends State<PlanAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenubarComp(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _detailWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  // 詳細部分ウィジェット
  Widget _detailWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            const Divider(
              thickness: 3,
              color: ColorConst.dark_grey,
              height: 20,
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
