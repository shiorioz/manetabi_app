import 'package:flutter/material.dart';
import 'package:manetabi_app/controller/bookmark_controller.dart';
import 'package:manetabi_app/model/post_model.dart';
import 'package:manetabi_app/view/component/card_component.dart';
import 'package:manetabi_app/view/page/post_detail_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<PostModel> _posts = [];

  @override
  void initState() {
    super.initState();
    _posts = BookmarkController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            heightFactor: 1.0,
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
                                  builder: (context) => PostDetailPage(
                                      planId: _posts[index].planId)));
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
      ),
    );
  }
}
