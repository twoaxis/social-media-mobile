class NotificationModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? createdAt;
  bool? isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.userId,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['createdAt'] ?? '',
        userId: json['userId'] ?? '',
        isRead: json['isRead'] ?? false,
      );
}
