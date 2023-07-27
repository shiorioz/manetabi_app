import '../model/post_model.dart';

class BookmarkController {
  // テスト用データ
  final List<PostModel> _posts = [
    PostModel(
      planId: 4,
      userId: 1,
      title: '関西一周の旅',
      isPublic: true,
      location: [
        '大阪',
        // '京都',
        // '奈良',
        // '神戸',
      ],
      tags: [
        '4人旅',
        '博物館巡り',
        '食べ歩き',
        // '4人旅',
        // '博物館巡り',
        // '食べ歩き',
      ],
      cost: 100000,
      thumbnailPath: 'assets/images/3.jpg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  // TODO: ここにAPI通信を書く

  List<PostModel> get post => _posts;
}
