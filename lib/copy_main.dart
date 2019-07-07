import 'package:flutter/material.dart';
import './Utils/reddit_api/getSavedPosts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reddit')
        ),
        body: RedditHome(),
      ),
    );
  }
}

class RedditHome extends StatefulWidget {
  @override
  _RedditHomeState createState() => _RedditHomeState();
}

class _RedditHomeState extends State<RedditHome> {
  List savedPosts;

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    savedPosts = await getSavedPosts();
    print("From fetchData: " + savedPosts.length.toString());
  }

  getPreviewImage(List savedPosts, int index) {
    String newPreviewUrl = "";
    dynamic preview = savedPosts[index]["data"]["preview"];
    if (preview!=null) {
      var previewUrl = preview["images"][0]["source"]["url"];
      var newPreviewUrl = previewUrl.replaceAll('amp;','');
      print("index " + index.toString() + ": " + newPreviewUrl);
      // while (newPreviewUrl.indexOf('amp;')>0) {
      //   newPreviewUrl = newPreviewUrl.replaceAll('amp;','');
      // } 
      return newPreviewUrl;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("From build: " + savedPosts.length.toString());
    return Material(
      child: ListView.builder(
        itemCount: savedPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                savedPosts[index]["data"]["title"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                savedPosts[index]["data"]["body"]!=null ? savedPosts[index]["data"]["body"] : '',
              ),
              SizedBox(height: 10.0,),
              Container(
                child: getPreviewImage(savedPosts, index) != null && getPreviewImage(savedPosts, index).length>0
                ? Image.network(getPreviewImage(savedPosts, index))
                : Text("Nothing")
              ),
              SizedBox(height: 10.0,),
            ],
          );
        },
      )      
    );
  }
}
