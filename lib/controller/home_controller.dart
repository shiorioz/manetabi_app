import '../model/post_model.dart';

class HomeController {
  // テスト用データ
  final List<PostModel> _post = [
    PostModel(
      planId: 1,
      userId: 1,
      title: '東京旅行',
      isPublic: false,
      thumbnailPath: 'assets/images/1.jpg',
      tags: ['2人旅', '1泊2日', '家族旅行'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    PostModel(
      planId: 2,
      userId: 2,
      title: '北海道旅行',
      isPublic: false,
      thumbnailPath: 'assets/images/2.jpg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    PostModel(
      planId: 3,
      userId: 3,
      title: '沖縄旅行',
      isPublic: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    PostModel(
      planId: 4,
      userId: 1,
      title: '関西一周の旅',
      isPublic: true,
      location: [
        '大阪',
      ],
      tags: [
        '4人旅',
        '博物館巡り',
        '食べ歩き',
      ],
      cost: 100000,
      thumbnailPath: 'assets/images/1.jpg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  // TODO: ここにAPI通信を書く

  List<PostModel> get post => _post;
}
