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
          // print("from main ${index} " + savedPosts[index].toString());
          return ListTile(
            title: savedPosts[index]!=null 
              ? Text(savedPosts[index].title) 
              : Text("Nothing to Show"),  
            // title: Text("Title"),  
            subtitle: Text("Body"),  
          );
        },
      ),
    );
  }
}
