import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PostModel> _post = [
    PostModel(
      plan_id: 1,
      user_id: 1,
      title: '東京旅行',
      is_public: false,
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
  final tags = ['2人旅', '1泊2日', '家族旅行'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _planListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // おすすめ部分ウィジェット
  Widget _planListWidget() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(Strings.recommend_month, style: TextStyle(fontSize: 20)),
        ),
        SizedBox(
          height: 1000,
          width: MediaQuery.of(context).size.width * 0.90,
          child: ListView.builder(
            itemCount: _post.length,
            itemBuilder: (context, index) {
              return _oneCard(_post[index]);
            },
          ),
        ),
      ],
    );
  }

  // カード（1枚）ウィジェット
  Widget _oneCard(PostModel post) {
    DateFormat dateFormat = DateFormat('yyyy/MM/dd');

    return Container(
      height: 130,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: InkWell(
        onTap: () {
          print('plan_id:' + post.plan_id.toString() + ' がタップされました');
        },
        // エフェクトの削除
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow[200],
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              post.title,
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const Divider(
                              thickness: 3,
                              color: ColorConst.dark_grey,
                              height: 14,
                              endIndent: 48),
                          // タグ
                          SizedBox(
                            height: 32,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tags.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: ColorConst.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 2.0),
                                            child: Text(tags[index]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // 日付
                          Row(
                            children: [
                              if (post.start_date != null &&
                                  post.end_date != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '${dateFormat.format(post.start_date!)} - ${dateFormat.format(post.end_date!)}',
                                    style: const TextStyle(letterSpacing: 1.1),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right,
                        size: 40, color: ColorConst.dark_grey),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
