import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/controller/bookmark_controller.dart';
import 'package:manetabi_app/view/component/menubar_component.dart';

import '../../controller/home_controller.dart';
import '../../model/post_model.dart';
import '../component/card_component.dart';

class PlanCopyPage extends StatefulWidget {
  const PlanCopyPage({super.key});

  @override
  State<PlanCopyPage> createState() => _PlanCopyPageState();
}

class _PlanCopyPageState extends State<PlanCopyPage> {
  List<PostModel> _posts = [];

  @override
  void initState() {
    super.initState();
    _posts = BookmarkController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenubarComp(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                StringConst.choosePlanText,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              _bookmarkListWidget(_posts),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookmarkListWidget(List<PostModel> _posts) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardComponent(
                post: _posts[index],
                onTap: () {
                  // TODO: 複製したプランを編集するページ(plan_edit_page)に遷移
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
