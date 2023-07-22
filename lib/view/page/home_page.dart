import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/constant/strings.dart';
import 'package:manetabi_app/controller/home_controller.dart';
import 'package:manetabi_app/model/post_model.dart';
import 'package:manetabi_app/view/page/post_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _post = [];

  @override
  void initState() {
    super.initState();
    _post = HomeController().post;
  }

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
          // detailページに遷移
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(plan_id: post.plan_id),
              ));
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        post.thumbnail_path ?? Strings.noImage,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
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
                              height: 6,
                              endIndent: 48),
                          // タグ
                          _tagsWidget(post, post.tags != null),
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

  // タグウィジェット
  Widget _tagsWidget(PostModel post, bool isTagExist) {
    if (isTagExist) {
      return SizedBox(
        height: 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: post.tags!.length,
          itemBuilder: (context, tagIndex) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConst.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 1.0),
                        child: Text(post.tags![tagIndex],
                            style: const TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
