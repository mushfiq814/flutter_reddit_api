class User {
  final String kind;
  final String id;
  final String name;
  final String iconImg;

  User({
    this.kind,
    this.id,
    this.name,
    this.iconImg,
  });

  factory User.getFromJson(Map<String, dynamic> json) {
    return new User(
      name:   json['data']['name'],
      iconImg:json['data']['icon_img'],
    );
  }
} 
