class Post {
  final String title;
  final String body;
  final int id;

  Post({required this.title, required this.body, required this.id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? 'No Title',
      body: json['body'] ?? 'No body',
      id: json['id'] ?? 0,
    );
  }
}
