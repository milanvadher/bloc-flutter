import 'package:blocarc/models/post.dart';
import 'package:blocarc/resources/post-repository.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  final repository = PostRepository();
  final postGetterSubject = PublishSubject<PostListModel>();

  Observable<PostListModel> get allPosts => postGetterSubject.stream;

  getAllPost() async {
    PostListModel posts = await repository.getAllPost();
    postGetterSubject.sink.add(posts);
  }

  dispose() {
    postGetterSubject.close();
  }

}

final blocPost = PostBloc();