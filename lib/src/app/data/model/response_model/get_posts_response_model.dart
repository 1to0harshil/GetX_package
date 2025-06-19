class GetPostsResponseModel {
  GetPostsResponseModel(
      {required this.posts,
      required this.total,
      required this.skip,
      required this.limit,});

  late final List<Posts> posts;
  late final int? total;
  late final int? skip;
  late final int? limit;

  GetPostsResponseModel.fromJson(Map<String, dynamic> json) {
    // if (json['posts'] != null) {
    //   posts = <Posts>[];
    //   json['posts'].forEach((v) {
    //     posts!.add(new Posts.fromJson(v));
    //   });
    // }
    posts = List.from(json['posts']).map((e) => Posts.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    final data = <String, dynamic>{};
    data['posts'] = posts.map((e) => e.toJson()).toList();
    // if (this.posts != null) {
    //   data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    // }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Posts(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions,});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    data['tags'] = tags;
    data['reactions'] = reactions;
    return data;
  }
}
