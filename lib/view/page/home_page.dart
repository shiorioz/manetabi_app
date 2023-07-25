import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/controller/home_controller.dart';
import 'package:manetabi_app/model/post_model.dart';
import 'package:manetabi_app/view/component/card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _post = [];

  @override
  void initState() {
    super.initState();
    _post = HomeController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _planListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // おすすめ部分ウィジェット
  Widget _planListWidget() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text(StringConst.recommendMonth, style: TextStyle(fontSize: 20)),
        ),
        CardComponent(posts: _post),
      ],
    );
  }
}
