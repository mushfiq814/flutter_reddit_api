import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit_app/Utils/models/Post.dart';
import 'package:reddit_app/Utils/reddit_api/getHotPosts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      leading: buildAvatar(currentPost.author),
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

  Widget buildAvatar(String name) {
    String nameInitials = name.substring(0,2).toUpperCase();

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage('https://www.redditstatic.com/avatars/avatar_default_06_25B79F.png'), fit: BoxFit.cover),
        
      ),
      height: 60.0,
      width: 60.0,
      // child: Text(nameInitials),
    );
  }
}