class PostModel {
  final int plan_id;
  final int user_id;
  final String title;
  final String? description;
  final String? thumbnail_path;
  final int? cost;
  final int? location_id;
  final DateTime? start_date;
  final DateTime? end_date;
  final bool is_public;
  final List<String>? tags;
  final DateTime created_at;
  final DateTime updated_at;

  PostModel({
    required this.plan_id,
    required this.user_id,
    required this.title,
    this.description,
    this.thumbnail_path,
    this.cost,
    this.location_id,
    this.start_date,
    this.end_date,
    required this.is_public,
    this.tags,
    required this.created_at,
    required this.updated_at,
  });
}
