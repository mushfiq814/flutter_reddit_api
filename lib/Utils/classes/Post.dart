class Post {
  final String kind;
  final String id;

  // Image Post Attributes
  final String title;
  final String imgUrl;

  // Comment Attributes
  final String author;

  Post({
    this.kind,
    this.id,
    this.title, 
    this.imgUrl,
    this.author,
  });

  factory Post.getFromJson(Map<String, dynamic> json, String kind) {
    if (kind == "t3") {
      return new Post(
        kind: "t3",
        id: "id",
        title: json["title"],
        imgUrl: "image",    
      );
    } else if (kind == "t1") {
      return new Post(
        kind: "t1",
        id: "id",
        author: "THIS IS A COMMENT"
      );
    } else {
      return new Post(
        kind: null,
        id: "id",
        title: "Nothing to Show"
      );
    }

  }
} 