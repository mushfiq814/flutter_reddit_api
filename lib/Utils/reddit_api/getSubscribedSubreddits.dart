import 'package:reddit_app/Utils/reddit_api/refreshToken.dart';
import './.config/.credentials.dart';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

Future<List> getSubscribedSubreddits() async {
  String token = await refreshToken();

  String oauthUri = credentials["OAUTH_URI"];
  String path = "subreddits/mine/subscriber";

  http.Response res = await http.get(
    oauthUri + path,
    headers: {
      HttpHeaders.authorizationHeader: "Bearer " + token
    }
  );
  
  return json.decode(res.body)["data"]["children"];
  
} 