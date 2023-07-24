import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/color_const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
            ),
            Icon(Icons.accessibility_new),
            ClipOval(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.network(
                    'https://www.pexels.com/ja-jp/photo/17503533/'),
              ),
            ),
            ClipPath(
              clipper: ImageClipper(),
              child: Container(color: Color.fromRGBO(0, 0, 0, 0.8)),
            ),
            Text(
              'MIYU',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              TabBar.secondary(
                controller: _tabController,
                // indicatorWeight: 2,
                indicatorPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                indicatorColor: ColorConst.black,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'プラン',
                      style: TextStyle(color: ColorConst.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '投稿済み',
                      style: TextStyle(color: ColorConst.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Text(''),
      ]),
    );
  }
}

//アイコン画像設定処理
class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width * 0.25,
        ),
      )
      // 全体
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
