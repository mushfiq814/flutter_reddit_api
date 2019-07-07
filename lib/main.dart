import 'package:flutter/material.dart';
import './Utils/reddit_api/getSavedPosts.dart';
import './Utils/Post.dart';

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
  bool isLoading = false;
  List<Post> savedPosts;

  @override
  initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    savedPosts = await getSavedPosts();
    setState(() => isLoading = false);
  }

  // getPreviewImage(List savedPosts, int index) {
  //   String newPreviewUrl = "";
  //   dynamic preview = savedPosts[index]["data"]["preview"];
  //   if (preview!=null) {
  //     var previewUrl = preview["images"][0]["source"]["url"];
  //     var newPreviewUrl = previewUrl.replaceAll('amp;','');
  //     print("index " + index.toString() + ": " + newPreviewUrl);
  //     // while (newPreviewUrl.indexOf('amp;')>0) {
  //     //   newPreviewUrl = newPreviewUrl.replaceAll('amp;','');
  //     // } 
  //     return newPreviewUrl;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: savedPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(savedPosts[index].title),  
            // title: Text("Title"),  
            subtitle: Text("Body"),  
          );
        },
      ),
    );
  }
}