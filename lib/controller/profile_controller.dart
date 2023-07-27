import '../model/post_model.dart';

class ProfileController {
  final List<PostModel> _post = [
    PostModel(
      planId: 3,
      userId: 3,
      title: '沖縄旅行',
      isPublic: false,
      // tags: ['ビーチ巡り'],
      thumbnailPath: 'assets/images/noimg.jpg',
      // TODO: サムネイル画像
      createdAt: DateTime.parse('2023-07-25 10:30:00.000000'),
      updatedAt: DateTime.now(),
    ),
  ];

  // TODO: ここにAPI通信を書く

  List<PostModel> get post => _post;
}
