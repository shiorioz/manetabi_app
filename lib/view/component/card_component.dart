import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../../model/post_model.dart';

class CardComponent extends StatelessWidget {
  final PostModel _post;
  final Function() _onTap;

  const CardComponent(
      {super.key, required PostModel post, required Function() onTap})
      : _post = post,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return _oneCard(_post, context);
  }

  // カード（1枚）ウィジェット
  Widget _oneCard(PostModel post, BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy/MM/dd');

    return InkWell(
      onTap: _onTap,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                            color: ColorConst.darkGrey,
                            height: 6,
                            endIndent: 48),
                        // タグ
                        _tagsWidget(post, post.tags != null),
                        const SizedBox(height: 4),
                        // 日付
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              dateFormat.format(post.createdAt),
                              style: const TextStyle(
                                  letterSpacing: 1.1, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
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
