import 'package:manetabi_app/controller/home_controller.dart';
import 'package:manetabi_app/model/post_model.dart';

class DetailController {
  final List<PostModel> _posts = HomeController().post;

  // PostModel getPost(int planId) => _post;
  PostModel get post => _posts[0];
  // planIdが一致するPostModelを返す
  Future<PostModel> getPost(int planId) async {
    for (var i = 0; i < _posts.length; i++) {
      if (_posts[i].planId == planId) {
        return await _posts[i];
      }
    }
    return _posts[0];
  }
}
