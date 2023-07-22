import 'package:flutter/material.dart';
import 'package:manetabi_app/controller/detail_controller.dart';
import 'package:manetabi_app/view/component/bottom_one_btn_component.dart';
import 'package:manetabi_app/view/component/bottom_two_btn_component.dart';

import '../../constant/colors.dart';
import '../../model/post_model.dart';
import '../component/menubar_component.dart';

class PostDetailPage extends StatefulWidget {
  final planId;

  const PostDetailPage({super.key, required this.planId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Future<PostModel> _getPlan() async {
    return DetailController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenubarComp(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _postDetailFutureWidget(context),
          ButtomOneBtnComp(
            context,
            btnText: 'プラン複製',
          ),
        ],
      ),
    );
  }

  Widget _postDetailFutureWidget(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: _getPlan(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          // ロード中
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // データがエラーを返した場合
          if (snapshot.hasError) {
            return Center(
              child: Text('エラー: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            // データが正常に返ってきた場合。
            return const Center(
              child: Text('データがありません。'),
            );
          }

          final data = snapshot.data;

          return _displayPostWidget(data);
        },
      ),
    );
  }

  // 詳細部分ウィジェット
  Widget _displayPostWidget(PostModel post) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 20),
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
}
