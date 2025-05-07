import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  // tested using postman
  // can see the posts but can't add, update and delete because dummy api

  static Future<List<Post>> fetchPosts() async {    // function for fetch post
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) { // if successfull
      List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<Post> createPost(Post post) async { // function for add post
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': post.title,
        'body': post.body,
        'userId': post.userId,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {  // if successful
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post: ${response.statusCode}');
    }
  }

  static Future<Post> updatePost(Post post) async { // function for update post
    final response = await http.put(Uri.parse('$baseUrl/${post.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()));
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  static Future<void> deletePost(int id) async {          // function for delete post
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
