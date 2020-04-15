import 'package:reddit_app/Utils/models/User.dart';
import 'package:reddit_app/Utils/reddit_api/refreshToken.dart';
import './.config/.credentials.dart';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

User getUserAbout(String userName) {
// Future<User> getUserAbout(String userName) async {
//   String token = await refreshToken();

//   String oauthUri = credentials['OAUTH_URI'];
//   String path = 'user/' + userName + '/about';

//   http.Response res = await http.get(
//     oauthUri + path,
//     headers: {
//       HttpHeaders.authorizationHeader: "Bearer " + token
//     }
//   );

//   if (res.statusCode == 200) {
//     dynamic response = json.decode(res.body);
//     User user = User.getFromJson(response);
//     return user;
//   } else {
//     print("ERROR in getting user: status code: " + res.statusCode.toString());
//     return null;
//   }

  print('Getting User Info');
  User user = User.getFromJson(userJson);
  return user;
}

Map<String,dynamic> userJson = {
    "kind": "t2",
    "data": {
        "is_employee": false,
        "icon_img": "https://styles.redditmedia.com/t5_wtfgv/styles/profileIcon_frsxtqoe1fh21.png?width=256&amp;height=256&amp;crop=256:256,smart&amp;s=d7baed382bba8b86d9ab3500788466488825ef65",
        "pref_show_snoovatar": false,
        "name": "ProfessorPengu",
        "is_friend": false,
        "created": 1550563001.0,
        "has_subscribed": true,
        "hide_from_robots": false,
        "created_utc": 1550534201.0,
        "link_karma": 13368,
        "comment_karma": 13949,
        "is_gold": false,
        "is_mod": false,
        "verified": true,
        "subreddit": {
            "default_set": true,
            "user_is_contributor": false,
            "banner_img": "https://styles.redditmedia.com/t5_wtfgv/styles/profileBanner_t6alpsif1fh21.png?width=1280&amp;height=384&amp;crop=1280:384,smart&amp;s=39d7b8db597bad64fa66083c886c7d1db1cb7caa",
            "restrict_posting": true,
            "user_is_banned": false,
            "free_form_reports": true,
            "community_icon": "",
            "show_media": true,
            "icon_color": "",
            "user_is_muted": false,
            "display_name": "u_ProfessorPengu",
            "header_img": null,
            "title": "Pengu",
            "over_18": false,
            "icon_size": [
                256,
                256
            ],
            "primary_color": "",
            "icon_img": "https://styles.redditmedia.com/t5_wtfgv/styles/profileIcon_frsxtqoe1fh21.png?width=256&amp;height=256&amp;crop=256:256,smart&amp;s=d7baed382bba8b86d9ab3500788466488825ef65",
            "description": "",
            "submit_link_label": "",
            "header_size": null,
            "restrict_commenting": false,
            "subscribers": 0,
            "submit_text_label": "",
            "is_default_icon": false,
            "link_flair_position": "",
            "display_name_prefixed": "u/ProfessorPengu",
            "key_color": "",
            "name": "t5_wtfgv",
            "is_default_banner": false,
            "url": "/user/ProfessorPengu/",
            "banner_size": [
                1280,
                384
            ],
            "user_is_moderator": false,
            "public_description": "Bloke just looking at memes. don't mind me.",
            "link_flair_enabled": false,
            "disable_contributor_requests": false,
            "subreddit_type": "user",
            "user_is_subscriber": false
        },
        "has_verified_email": true,
        "id": "393cyw75"
    }
};