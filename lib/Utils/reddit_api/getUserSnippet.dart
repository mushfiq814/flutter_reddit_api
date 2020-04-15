import 'package:reddit_app/Utils/models/Post.dart';
import 'package:reddit_app/Utils/reddit_api/refreshToken.dart';
import './.config/.credentials.dart';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'getHotPosts.dart';

List<Post> getHotPosts(String subredditName) {
Future<List<Post>> getHotPosts(String subredditName) async {
  String token = await refreshToken();

  String oauthUri = credentials['OAUTH_URI'];
  String path = 'r/' + subredditName + '/hot';

  http.Response res = await http.get(
    oauthUri + path,
    headers: {
      HttpHeaders.authorizationHeader: "Bearer " + token
    }
  );

  if (res.statusCode == 200) {
    List<dynamic> response = json.decode(res.body)['data']['children'] as List;
    List<Post> posts = response.map((item) => new Post.getFromJson(item)).toList();
    return posts;
  } else {
    print("ERROR in getting post: status code: " + res.statusCode.toString());
    return null;
  }

  print('Getting Hot Posts');
  List res = hotPosts['data']['children'] as List;
  List<Post> posts = res.map((item) => new Post.getFromJson(item)).toList();
  print('Found: ' + posts.length.toString() + ' posts in ' + subredditName);
  return posts;
}

Map<String,dynamic> userDataList = {
    "t2_ecwfy": {
        "name": "ZePyro",
        "created_utc": 1387070162.0,
        "link_karma": 30659,
        "comment_karma": 3192,
        "profile_img": "https://www.redditstatic.com/avatars/avatar_default_03_24A0ED.png",
        "profile_color": "",
        "profile_over_18": false
    },
    "t2_t32a0df": {
        "name": "vmanny0908",
        "created_utc": 1516569018.0,
        "link_karma": 416,
        "comment_karma": 94,
        "profile_img": "https://www.redditstatic.com/avatars/avatar_default_08_24A0ED.png",
        "profile_color": "",
        "profile_over_18": false
    }
};