import './refreshToken.dart';
import '../classes/Post.dart';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

Future<List<Post>> getSavedPosts() async {
  String token = await refreshToken();

  String oauthUri = "https://oauth.reddit.com/";
  String path = "/user/mushfiq_814/saved";
  String query = "?limit=30";
  String after = "";
  // if (after.length > 0) query += ('&after=' + after.toString());

  http.Response res = await http.get(
    oauthUri + path + query,
    headers: {
      HttpHeaders.authorizationHeader: "Bearer " + token
    }
  );

  if (res.statusCode == 200) {
    dynamic response = json.decode(res.body);

    List resList = (response["data"]["children"] as List)
      .map((item) => new Post.getFromJson(item["data"], item["kind"]))
      .toList();
      
    return resList;
  } else {
    print("ERROR in getting post: status code: " + res.statusCode.toString());
    return null;
  }
}

// loop through each item
  // results.forEach(element => {
  //   if (!element.data.over_18) {
  //     postLink = "https://www.reddit.com" + element.data.permalink;
  //     title = element.data.title;
  //     content = element.data.body ? truncateText(element.data.body,100) : 'nothing to show';

  //     // if it is a post
  //     if (element.kind=='t3') {
  //       // for gfycats only
  //       if (element.data.domain == 'gfycat.com') {
  //         const str = element.data.url;
  //         const gfycatUrlArray = str.split('https://gfycat.com/');
  //         var imageUrl = 'https://gfycat.com/ifr/' + gfycatUrlArray[1];
  //       } else {
  //         var preview = element.data.preview;
  //         if (preview) {
  //           var previewUrl = preview.images[0].source.url;
  //           var newPreviewUrl = previewUrl.replace('amp;','');
  //           while (newPreviewUrl.indexOf('amp;')>0) {
  //             newPreviewUrl = newPreviewUrl.replace('amp;','');
  //           } 
  //         } 
  //       }                     
  //     } 
  //     // if it is a comment
  //     else if (element.kind=='t1')

  //   }
  // }