class PostListModel {
  final List<PostModel> posts;

  PostListModel({
    this.posts,
  });

  factory PostListModel.fromJson(List<dynamic> parsedJson) {
    List<PostModel> posts = new List<PostModel>();
    posts = parsedJson.map((i) => PostModel.fromJson((i))).toList();

    return new PostListModel(
      posts: posts,
    );
  }
}

class PostModel {
  String id;
  String userProfile;
  String userName;
  String time;
  String description;
  String image;
  int likes;
  int comments;
  int share;

  PostModel(
      {this.id,
        this.userProfile,
        this.userName,
        this.time,
        this.description,
        this.image,
        this.likes,
        this.comments,
        this.share});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userProfile = json['userProfile'];
    userName = json['userName'];
    time = json['time'];
    description = json['description'];
    image = json['image'];
    likes = json['likes'];
    comments = json['comments'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userProfile'] = this.userProfile;
    data['userName'] = this.userName;
    data['time'] = this.time;
    data['description'] = this.description;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['share'] = this.share;
    return data;
  }
}
