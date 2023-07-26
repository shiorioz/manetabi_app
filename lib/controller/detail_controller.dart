import 'package:manetabi_app/model/block_model.dart';
import 'package:manetabi_app/model/post_model.dart';

class DetailController {
  final PostModel _post = PostModel(
      planId: 1,
      userId: 1,
      title: '関西一周の旅',
      isPublic: true,
      location: [
        '大阪',
        // '京都',
        // '奈良',
        // '神戸',
      ],
      tags: [
        '4人旅',
        '博物館巡り',
        '食べ歩き',
        // '4人旅',
        // '博物館巡り',
        // '食べ歩き',
      ],
      cost: 100000,
      thumbnailPath: 'assets/images/3.jpg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      block: [
        BlockModel(
          blockId: 1,
          planId: 1,
          blockName: '大阪駅',
          details: '関西最大級の駅です。',
          address: '大阪府大阪市北区梅田３丁目１−１',
          startDate: DateTime.parse('2023-07-23 10:30:00.000000'),
          endDate: DateTime.parse('2023-07-23 12:00:00.000000'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          day: 1,
        ),
        BlockModel(
          blockId: 2,
          planId: 1,
          blockName: 'USJ',
          startDate: DateTime.parse('2023-07-23 12:00:00.000000'),
          endDate: DateTime.parse('2023-07-23 14:00:00.000000'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          day: 1,
        ),
        BlockModel(
          blockId: 3,
          planId: 1,
          blockName: 'ホテルで朝食',
          startDate: DateTime.parse('2023-07-23 09:00:00.000000'),
          endDate: DateTime.parse('2023-07-23 10:00:00.000000'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          day: 2,
        ),
        BlockModel(
          blockId: 4,
          planId: 1,
          blockName: '通天閣',
          details: 'ああああああああああああああああああああああああああああああああああああああああああああああ',
          startDate: DateTime.parse('2023-07-23 10:00:00.000000'),
          endDate: DateTime.parse('2023-07-23 14:00:00.000000'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          day: 2,
        ),
      ]);

  // PostModel getPost(int planId) => _post;
  PostModel get post => _post;
}
