
class ModelListData {
  int userId;
  int id;
  String title;
  String body;

  ModelListData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ModelListData.fromJson(Map<String, dynamic> json) => ModelListData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
