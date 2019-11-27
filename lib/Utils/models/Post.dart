class Post {
  final String kind;
  final String id;
  final String subreddit;
  final String title;
  final String author;
  final int ups;
  final int downs;
  final int score;
  final DateTime created;
  final bool saved;
  final int numComments;
  final String url;
  final String thumbnail;
  final Map<String,dynamic> preview;

  Post({
    this.kind,
    this.id,
    this.subreddit,
    this.title,
    this.author,
    this.ups,
    this.downs,
    this.score,
    this.created,
    this.saved,
    this.numComments,
    this.url,
    this.thumbnail,
    this.preview,
  });

  factory Post.getFromJson(Map<String, dynamic> json) {
    return new Post(
      kind:       json['kind'],
      id:         json['data']['id'],
      subreddit:  json['data']['subreddit'],
      title:      json['data']['title'],
      author:     json['data']['author'],
      ups:        json['data']['ups'],
      downs:      json['data']['downs'],
      score:      json['data']['score'],
      created:    DateTime.fromMillisecondsSinceEpoch((json['data']['created']).round() * 1000),
      saved:      json['data']['saved'],
      numComments:json['data']['num_comments'],
      url:        json['data']['url'],
      thumbnail:  json['data']['thumbnail'],
      preview:    json['data']['preview'],
    );
  }
} 
