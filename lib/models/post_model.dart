class Post {    // model for post
  int? id;
  String title;
  String body;
  int userId;

  Post({this.id, required this.title, required this.body, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    userId: json['userId'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'userId': userId,
  };
}
