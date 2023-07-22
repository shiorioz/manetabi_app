import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _searchWidget(),
      ),
    );
  }

  // 検索ウィジェット
  Widget _searchWidget() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: ColorConst.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.search),
            label: Text('検索'),
            backgroundColor: ColorConst.white,
            foregroundColor: ColorConst.black,
          ),
        ],
      ),
    );
  }
}
