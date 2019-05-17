import 'dart:convert';

import 'package:blocarc/models/post.dart';
import 'package:http/http.dart' show Client;

class PostApiHelper {
  Client client = new Client();
  final baseUrl = 'http://5c9db1fd3be4e30014a7d3da.mockapi.io';
  var headers = {'Content-Type': 'application/json'};

  Future<PostListModel> getPosts() async {
    final response = await client.get('$baseUrl/post', headers: headers);
    print('${response.body}');
    return PostListModel.fromJson(json.decode(response.body));
  }
}