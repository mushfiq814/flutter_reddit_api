class Comment {
  final String id;
  final String title;
  
  Comment({
    this.id,
    this.title    
  });

  factory Comment.getFromJson(Map<String, dynamic> json) {
    return new Comment(
      id: json["id"],
      title: json["author"]
    );
  }
}