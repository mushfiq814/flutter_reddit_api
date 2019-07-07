import 'package:flutter/material.dart';
import './Utils/reddit_api/getSavedPosts.dart';
import './Utils/classes/Post.dart';

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
  List<dynamic> savedPosts;

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    savedPosts = await getSavedPosts();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: savedPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: savedPosts[index].kind == "t1"
              ? Text(savedPosts[index].title)
              : Text(savedPosts[index].title),
            subtitle: Image.network(
              savedPosts[index].kind == "t3"
                ? savedPosts[index].imgUrl
                : 'https://picsum.photos/250?image=9',
            ),  
          );
        },
      ),
    );
  }
}
