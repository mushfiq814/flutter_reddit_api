import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import './.config/.credentials.dart';

Future<String> refreshToken() async {
  String tokenUri = "https://www.reddit.com/api/v1/access_token";

  String basicAuthHeader = credentials['CLIENT_ID'] + ":" + credentials['CLIENT_SECRET'];
  List<int> basicAuthHeaderBytes = utf8.encode(basicAuthHeader);
  String basicAuthHeaderEncoded = "Basic " + base64.encode(basicAuthHeaderBytes);

  Map<String, String> jsonBody = {
    "grant_type" : "refresh_token",
    "refresh_token" : credentials['REFRESH_TOKEN']
  };

  http.Response res = await http.post(
    tokenUri,
    headers: {
      HttpHeaders.authorizationHeader: basicAuthHeaderEncoded
    },
    body: jsonBody
  );

  String accessToken = json.decode(res.body)['access_token'];
  return accessToken;
}