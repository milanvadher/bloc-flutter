import 'package:blocarc/models/post.dart';
import 'package:blocarc/resources/api-helper-post.dart';

class PostRepository {
  final postApiHelper = PostApiHelper();

  Future<PostListModel> getAllPost() => postApiHelper.getPosts();
}