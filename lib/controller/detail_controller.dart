import 'package:manetabi_app/model/post_model.dart';

class DetailController {
  final PostModel _post = PostModel(
    planId: 1,
    userId: 1,
    title: '大阪旅行',
    isPublic: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  // PostModel getPost(int planId) => _post;
  PostModel get post => _post;
}
