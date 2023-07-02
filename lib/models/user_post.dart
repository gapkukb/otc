class UserPost {
  String? title;

  UserPost({this.title});

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
