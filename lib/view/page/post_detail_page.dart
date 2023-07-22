import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final int planId;

  PostDetailPage({super.key, required this.planId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('PostDetailPage: ' + planId.toString() + '番目の投稿'),
    ));
  }
}
