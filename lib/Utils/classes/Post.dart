class Post {
  final String id;
  final String title;
  final String imgUrl;

  Post({
    this.id,
    this.title, 
    this.imgUrl,
  });

  factory Post.getFromJson(Map<String, dynamic> json) {
    return new Post(
      id: "id",
      title: json["subreddit"],
      imgUrl: "image",    
    );
  }
} 