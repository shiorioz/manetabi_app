import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/controller/home_controller.dart';
import 'package:manetabi_app/model/post_model.dart';
import 'package:manetabi_app/view/component/card_component.dart';
import 'package:manetabi_app/view/page/post_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _posts = [];

  @override
  void initState() {
    super.initState();
    _posts = HomeController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(StringConst.recommendMonth,
                  style: TextStyle(fontSize: 20)),
            ),
            _planListWidget(),
          ],
        ),
      ),
    );
  }

  // おすすめ部分ウィジェット
  Widget _planListWidget() {
    return Column(
      children: [
        Center(
          child: SizedBox(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailPage(planId: _posts[index].planId),
                            ));
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
