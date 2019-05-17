import 'package:blocarc/models/post.dart';
import 'package:flutter/material.dart';
import '../blocs/post-bloc.dart';
import 'package:intl/intl.dart';

class PostList extends StatelessWidget {

  final Widget loading = Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    blocPost.getAllPost();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Post'),
      ),
      body: StreamBuilder(
        stream: blocPost.allPosts,
        builder: (BuildContext context, AsyncSnapshot<PostListModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading;
            case ConnectionState.none:
              return Text('In none');
            default:
              if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
              return buildPostView(snapshot.data.posts);
          }
        },
      ),
    );
  }
}

Widget buildPostView(List<PostModel> posts) {
  return ListView(
    children: List.generate(posts.length, (int index) {
      PostModel post = posts[index];
      DateTime date = DateTime.parse(post.time).toLocal();
      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(post.userProfile),
              ),
              title: Text(post.userName),
              subtitle: Text('${DateFormat.yMEd().add_jms().format(date)}'),
            ),
            Container(
              child: Image.network(post.image),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text('${post.description}'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(5),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.thumb_up),
                        SizedBox(width: 10),
                        Text('${post.likes}')
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.comment),
                        SizedBox(width: 10),
                        Text('${post.comments}'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.share),
                        SizedBox(width: 10),
                        Text('${post.share}')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }),
  );
}