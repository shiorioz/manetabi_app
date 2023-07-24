import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../../model/post_model.dart';
import '../page/post_detail_page.dart';

class CardComponent extends StatelessWidget {
  final PostModel _post;

  const CardComponent({super.key, required PostModel post}) : _post = post;

  @override
  Widget build(BuildContext context) {
    return _oneCard(_post, context);
  }

  Widget _oneCard(PostModel post, BuildContext context) {
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
                builder: (context) => PostDetailPage(planId: post.planId),
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
                        post.thumbnailPath ?? StringConst.noImagePath,
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
                              if (post.startDate != null &&
                                  post.endDate != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '${dateFormat.format(post.startDate!)} - ${dateFormat.format(post.endDate!)}',
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