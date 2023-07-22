import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  int plan_id;

  PostDetailPage({super.key, required this.plan_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('PostDetailPage: ' + plan_id.toString() + '番目の投稿'),
    ));
  }
}
