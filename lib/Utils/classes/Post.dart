class Post {
  final String kind;
  final String id;
  final String subreddit;

  // Image Post Attributes
  final String title;
  final String imgUrl;
  final Map<String,dynamic> previewList;

  // Comment Attributes
  final String author;

  Post({
    this.kind,
    this.id,
    this.subreddit,
    this.title, 
    this.imgUrl,
    this.previewList,
    this.author,
  });

  factory Post.getFromJson(Map<String, dynamic> json, String kind) {
    if (kind == "t3") {
      return new Post(
        kind: "t3",
        id: "id",
        title: json["title"],
        previewList: json["preview"],
        imgUrl: "img",
        subreddit: 'r/' + json["subreddit"] 
      );
    } else if (kind == "t1") {
      return new Post(
        kind: "t1",
        id: "id",
        title: json["link_title"],
        author: json["author"],
        subreddit: 'r/' + json["subreddit"]
      );
    } else {
      return new Post(
        kind: null,
        id: "id",
        title: "Nothing to Show",
        subreddit: 'r/' + json["subreddit"]
      );
    }

  }
} 