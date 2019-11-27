import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit_app/Utils/reddit_api/getHotPosts.dart';
import './Utils/reddit_api/getSavedPosts.dart';
import './Utils/models/Post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Demo',
      theme: ThemeData(fontFamily: 'Lato'),
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
  List<Post> hotPosts;

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // hotPosts = await getHotPosts('android');
    hotPosts = getHotPosts('android');
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {    
    return Material(
      child: Container(
        child: isLoading
        ? CircularProgressIndicator()
        : ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: hotPosts.length,
          itemBuilder: (BuildContext context, int index) => buildPostCard(index)
        ),
      ),
    );
  }

  Widget buildPostCard(int index) {
    Post currentPost = hotPosts[index];
    String formattedDate = DateFormat('M/d/yyyy h:m a').format(currentPost.created);

    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: Text(currentPost.score.toString()),
      title: Text(currentPost.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(currentPost.author),
          Image.network(currentPost.thumbnail),
        ],
      ),
      trailing: Text(formattedDate),
    );
  }
}
