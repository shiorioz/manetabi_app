import 'package:manetabi_app/model/post_model.dart';

class DetailController {
  final PostModel _post = PostModel(
    planId: 1,
    userId: 1,
    title: '関西一周の旅',
    isPublic: true,
    location: [
      '大阪',
      '京都',
      '奈良',
      '神戸',
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
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  // PostModel getPost(int planId) => _post;
  PostModel get post => _post;
}
