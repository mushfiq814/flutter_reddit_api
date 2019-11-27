class Post {
  final String kind;
  final String id;
  final String subreddit;
  final String title;
  final String imgUrl;
  final Map<String,dynamic> previewList;

  Post({
    this.kind,
    this.id,
    this.subreddit,
    this.title, 
    this.imgUrl,
    this.previewList,
  });

  factory Post.getFromJson(Map<String, dynamic> json) {
    return new Post(
      kind: json['kind'],
      id: json['data']['id'],
      subreddit: json['data']['subreddit'],
      title: json['data']['title'],
      imgUrl: "img",
      previewList: json['data']['preview'],
    );
  }
} 