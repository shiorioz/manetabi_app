import '../model/block_model.dart';
import '../model/post_model.dart';

class HomeController {
  // テスト用データ
  final List<PostModel> _post = [
    PostModel(
      planId: 1,
      userId: 1,
      title: '東京旅行',
      isPublic: false,
      thumbnailPath: 'assets/images/1.jpg',
      tags: ['1泊2日', '家族旅行'],
      createdAt: DateTime.parse('2023-07-20 12:30:00.000000'),
      updatedAt: DateTime.now(),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    PostModel(
        planId: 4,
        userId: 1,
        title: '関西一周の旅',
        isPublic: true,
        location: [
          '大阪',
        ],
        tags: [
          '4人旅',
          '博物館巡り',
          '食べ歩き',
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
            startDate: DateTime.parse('2023-07-23 10:00:00.000000'),
            endDate: DateTime.parse('2023-07-23 14:00:00.000000'),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            day: 2,
          ),
        ]),
    PostModel(
      planId: 6,
      userId: 2,
      title: '家族でグランピング',
      isPublic: true,
      tags: ['家族旅行', '自然'],
      thumbnailPath: 'assets/images/4.jpg',
      createdAt: DateTime.parse('2023-07-27 10:30:00.000000'),
      updatedAt: DateTime.parse('2023-07-27 10:30:00.000000'),
    ),
    PostModel(
      planId: 9,
      userId: 2,
      title: '海岸ドライブ',
      isPublic: true,
      tags: ['ドライブ', '絶景'],
      thumbnailPath: 'assets/images/9-4.png',
      description: '海岸沿いをドライブします。',
      location: ['金沢'],
      cost: 50000,
      block: [
        // 渚ドライブウェイ
// 能登丼
// 能登半島国定公園
// 金沢カレー
        BlockModel(
          blockId: 0,
          planId: 9,
          blockName: '渚ドライブウェイ',
          details: '日本唯一の砂浜道路！景色を堪能できます',
          // address: '石川県羽咋市新保町上',
          startDate: DateTime.parse('2023-05-27 10:30:00.000000'),
          endDate: DateTime.parse('2023-07-29 12:00:00.000000'),
          createdAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          updatedAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          day: 1,
        ),
        BlockModel(
          blockId: 0,
          planId: 9,
          blockName: '能登丼',
          details: '新鮮な海鮮丼でお腹いっぱいに！',
          startDate: DateTime.parse('2023-05-27 12:30:00.000000'),
          endDate: DateTime.parse('2023-07-29 14:00:00.000000'),
          createdAt: DateTime.parse('2023-06-30 14:00:00.000000'),
          updatedAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          day: 1,
        ),
        BlockModel(
          blockId: 0,
          planId: 9,
          blockName: 'ホテルで一泊',
          startDate: DateTime.parse('2023-05-27 19:30:00.000000'),
          endDate: DateTime.parse('2023-07-29 14:00:00.000000'),
          createdAt: DateTime.parse('2023-06-30 19:30:00.000000'),
          updatedAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          day: 1,
        ),
        BlockModel(
          blockId: 0,
          planId: 9,
          blockName: '能登半島国定公園',
          startDate: DateTime.parse('2023-05-27 10:30:00.000000'),
          endDate: DateTime.parse('2023-07-29 14:00:00.000000'),
          createdAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          updatedAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          day: 2,
        ),
        BlockModel(
          blockId: 0,
          planId: 9,
          blockName: '金沢カレー',
          startDate: DateTime.parse('2023-05-27 13:30:00.000000'),
          endDate: DateTime.parse('2023-07-29 14:00:00.000000'),
          createdAt: DateTime.parse('2023-06-30 13:30:00.000000'),
          updatedAt: DateTime.parse('2023-06-30 10:30:00.000000'),
          day: 2,
        ),
      ],
      createdAt: DateTime.parse('2023-07-27 10:30:00.000000'),
      updatedAt: DateTime.parse('2023-07-27 10:30:00.000000'),
    ),
    PostModel(
      planId: 2,
      userId: 2,
      title: '北海道旅行',
      isPublic: false,
      thumbnailPath: 'assets/images/2.jpg',
      tags: ['スキー旅行'],
      createdAt: DateTime.parse('2023-07-23 10:30:00.000000'),
      updatedAt: DateTime.now(),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    PostModel(
      planId: 8,
      userId: 2,
      title: '友達と海ほたる',
      isPublic: true,
      tags: ['二人旅行', '自然'],
      thumbnailPath: 'assets/images/4.jpg',
      createdAt: DateTime.parse('2023-07-27 10:30:00.000000'),
      updatedAt: DateTime.parse('2023-07-27 10:30:00.000000'),
    ),
    PostModel(
      planId: 7,
      userId: 2,
      title: '温泉旅行',
      isPublic: true,
      tags: ['家族旅行', '自然'],
      thumbnailPath: 'assets/images/4.jpg',
      createdAt: DateTime.parse('2023-07-27 10:30:00.000000'),
      updatedAt: DateTime.parse('2023-07-27 10:30:00.000000'),
    ),
  ];

  // TODO: ここにAPI通信を書く

  List<PostModel> get post => _post;
}

// ツーリング
// ドライブベイ
// 六甲

