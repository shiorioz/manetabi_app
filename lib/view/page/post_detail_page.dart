import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:manetabi_app/controller/detail_controller.dart';
import 'package:manetabi_app/model/block_model.dart';
import 'package:manetabi_app/view/component/icon_btn_component.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../../model/post_model.dart';
import '../component/menubar_component.dart';

class PostDetailPage extends StatefulWidget {
  final int planId;

  const PostDetailPage({super.key, required this.planId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Future<PostModel> _getPlan() async {
    return DetailController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenubarComp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _postDetailFutureWidget(context),
            IconBtnComponent(
              context,
              btnText: StringConst.keepText,
              icon: FontAwesomeIcons.solidCircleDown,
              onPressed: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _postDetailFutureWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
        future: _getPlan(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          // ロード中
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // データがエラーを返した場合
          if (snapshot.hasError) {
            return Center(
              child: Text('エラー: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            // データが正常に返ってきた場合。
            return const Center(
              child: Text('データがありません。'),
            );
          }

          final data = snapshot.data;

          return _displayPostWidget(data);
        },
      ),
    );
  }

  // 詳細部分ウィジェット
  Widget _displayPostWidget(PostModel post) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 見出し
            _headlineWidget(post),
            const SizedBox(height: 20),
            // タグ
            _tagWidget(post.tags),
            const SizedBox(height: 20),
            // 費用
            _costWidget(post.cost),
            const SizedBox(height: 20),
            // ブロック
            _blockWidget(post.block!),
          ],
        ),
      ),
    );
  }

  // 場所ウィジェット
  Widget _locationWidget(String location) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 4, bottom: 4, right: 2),
          child: Row(
            children: [
              const SizedBox(width: 2),
              Text(
                location,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headlineWidget(PostModel post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // サムネイル画像
        if (post.thumbnailPath != null)
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                post.thumbnailPath!,
                height: 120,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
        const SizedBox(height: 20),
        // タイトルウィジェット
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 34,
              child: Material(
                color: ColorConst.pink,
                shape: const CircleBorder(),
                child: InkWell(
                  radius: 20,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      // TODO: いいねボタンを押した時の処理
                    },
                    icon: const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: ColorConst.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 3,
          color: ColorConst.darkGrey,
          height: 20,
        ),
        // 場所・日付ウィジェット
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.locationDot,
                  size: 20,
                  color: ColorConst.darkGrey,
                ),
                const SizedBox(width: 4),
                SizedBox(
                  height: 38,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: post.location!.length,
                    itemBuilder: (context, index) {
                      return _locationWidget(post.location![index]);
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                DateFormat('yyyy/MM/dd').format(post.createdAt),
                style: const TextStyle(fontSize: 16, letterSpacing: 1.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 費用ウィジェット
  Widget _costWidget(int? cost) {
    if (cost != null) {
      final formatter = NumberFormat("#,###");

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Row(
            children: [
              // TODO: お金のアイコン変更
              Icon(FontAwesomeIcons.sackDollar,
                  size: 22, color: ColorConst.darkGrey),
              SizedBox(width: 4),
              Text(
                'budget ',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.currency_yen, size: 16, color: ColorConst.black),
              Text(formatter.format(cost),
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      );
    } else {
      return const SizedBox(height: 20);
    }
  }

  // タグウィジェット
  Widget _tagWidget(List<String>? tags) {
    if (tags != null) {
      return SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, tagIndex) {
            return Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConst.jungleMint,
                    borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.tag,
                          size: 16, color: ColorConst.darkGrey),
                      const SizedBox(width: 4),
                      Text(tags[tagIndex],
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox(height: 30);
    }
  }

  // ブロックウィジェット
  Widget _blockWidget(List<BlockModel>? block) {
    // bool _isTileExpanded = false;

    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: block!.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (block[index].day != block[(index - 1) % block.length].day)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'day${block[index].day}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(
                          DateFormat('Hm').format(block[index].startDate),
                          style: const TextStyle(fontSize: 20)),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ExpansionTile(
                                textColor: ColorConst.black,
                                iconColor: ColorConst.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                leading: const Icon(FontAwesomeIcons.sortDown,
                                    size: 18, color: ColorConst.darkGrey),
                                // 開閉でアイコン変更（うまくできない）
                                // leading: Icon(_isTileExpanded
                                //     ? Icons.arrow_drop_down
                                //     : Icons.arrow_right),
                                // onExpansionChanged: (bool expanded) {
                                //   setState(() => _isTileExpanded = expanded);
                                // },
                                title: Text(block[index].blockName,
                                    style: const TextStyle(fontSize: 20)),
                                children: <Widget>[
                                  _detailTextWidget(block[index]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // detailTextウィジェット
  Widget _detailTextWidget(BlockModel block) {
    if (block.details != null) {
      return Text(block.details!);
    }
    return const SizedBox(height: 20);
  }
}
