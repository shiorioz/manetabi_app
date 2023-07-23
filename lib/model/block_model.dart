class BlockModel {
  final int blockId; // ブロックID
  final int planId; // プランID
  final String blockName; // ブロック名
  final DateTime startDate; // 開始日時
  final DateTime endDate; // 終了日時
  final String? memo; // メモ
  final int? cost; // 費用
  final String? address; // 住所
  final String? details; // 詳細
  final DateTime createdAt; // 作成した時間
  final DateTime updatedAt; // 更新した時間
  // TODO: 整理
  final int? day; // 日数

  BlockModel({
    required this.blockId,
    required this.planId,
    required this.blockName,
    required this.startDate,
    required this.endDate,
    this.memo,
    this.cost,
    this.address,
    this.details,
    required this.createdAt,
    required this.updatedAt,
    this.day,
  });
}
