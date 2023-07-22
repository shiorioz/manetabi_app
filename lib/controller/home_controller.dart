import '../model/post_model.dart';

class HomeController {
  // テスト用データ
  final List<PostModel> _post = [
    PostModel(
      plan_id: 1,
      user_id: 1,
      title: '東京旅行',
      is_public: false,
      tags: ['2人旅', '1泊2日', '家族旅行'],
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
      start_date: DateTime.now(),
      end_date: DateTime.now(),
    ),
    PostModel(
      plan_id: 2,
      user_id: 2,
      title: '北海道旅行',
      is_public: false,
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
      start_date: DateTime.now(),
      end_date: DateTime.now(),
    ),
    PostModel(
      plan_id: 3,
      user_id: 3,
      title: '沖縄旅行',
      is_public: false,
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
    ),
  ];

  // TODO: ここにAPI通信を書く

  List<PostModel> get post => _post;
}
