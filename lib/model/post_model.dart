class PostModel {
  final int planId;
  final int userId;
  final String title;
  final String? description;
  final String? thumbnailPath;
  final int? cost;
  // final int? locationId;
  final List<String>? location;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isPublic;
  final List<String>? tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  PostModel({
    required this.planId,
    required this.userId,
    required this.title,
    this.description,
    this.thumbnailPath,
    this.cost,
    this.location,
    this.startDate,
    this.endDate,
    required this.isPublic,
    this.tags,
    required this.createdAt,
    required this.updatedAt,
  });
}
