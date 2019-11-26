import 'package:flutter/material.dart';
import './Utils/reddit_api/getSavedPosts.dart';
import './Utils/classes/Post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Demo',
      theme: ThemeData(fontFamily: 'Product-Sans'),
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
      child: Container(
        width: 400.0,
        child: isLoading
        ? CircularProgressIndicator()
        : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: savedPosts.length,
          itemBuilder: (BuildContext context, int index) => buildPostCard(index)
        ),
      ),
    );
  }

  Widget buildPostCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        savedPosts[index].kind == "t1"
          ? Text(savedPosts[index].title, style: titleStyle,)
          : Text(savedPosts[index].title, style: titleStyle,),
        Text(savedPosts[index].subreddit, style: subtitleStyle),
        Image.network(
          savedPosts[index].kind == "t3" && savedPosts[index].previewList != null
            ? savedPosts[index].previewList["images"][0]["variants"].containsKey("gif")
              ? savedPosts[index].previewList["images"][0]["variants"]["gif"]["source"]["url"]
              : savedPosts[index].previewList["images"][0]["source"]["url"].replaceAll('amp;','')
            : 'https://picsum.photos/250?image=9',
          fit: BoxFit.contain
        ), 
        // savedPosts[index].kind == "t3"
        //   ? Text(savedPosts[index].previewList["images"][0]["source"]["url"].replaceAll('amp;',''))
        //   : Text('https://picsum.photos/250?image=9'),
        // SizedBox(height: 20.0,),
      ],
    );
  }

  TextStyle titleStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle subtitleStyle = TextStyle(
    fontSize: 30.0,
  );
}
