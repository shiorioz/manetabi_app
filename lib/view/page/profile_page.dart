import 'package:flutter/material.dart';
import 'package:manetabi_app/constant/colors.dart';
import 'package:manetabi_app/controller/home_controller.dart';
import 'package:manetabi_app/model/post_model.dart';
import 'package:manetabi_app/view/component/card_component.dart';
import 'package:manetabi_app/view/page/post_detail_page.dart';

// class TabBarApp extends StatelessWidget {
//   const TabBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const ProfilePage(),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<PostModel> _post = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _post = HomeController().post;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(children: <Widget>[
          _IconWidget(),
          const Text(
            'MIYU',
            style: TextStyle(fontSize: 30),
          ),
        ]),
        Flexible(
            child: Container(
          child: _Tabbar(),
        ))
      ],
    ));
  }

  //アイコン画像設定処理
  Widget _IconWidget() {
    return Container(
      height: 90,
      width: 150,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/images/Icon.jpg"))),
    );
  }

//タブ
  Widget _Tabbar() {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: ColorConst.black,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'my plan',
                  style: TextStyle(color: ColorConst.black),
                ),
              ),
              Tab(
                child: Text(
                  'my page',
                  style: TextStyle(color: ColorConst.black),
                ),
              )
            ],
          ),
          Flexible(
              child: Container(
            child: Scaffold(
              body: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    heightFactor: 1.0,
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _post.length,
                        itemBuilder: (context, index) {
                          return _card(context, index);
                        },
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 1.0,
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _post.length,
                        itemBuilder: (context, index) {
                          return _card(context, index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  //card
  Widget _card(context, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardComponent(
          post: _post[index],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PostDetailPage(planId: _post[index].planId)));
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
