import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Post.dart';

class Postservice {
  static const String url = 'https://news.webike.net/wp-json/wp/v2/posts';
  
  static List<Post> parsePost(String responseBody) {
    final list = json.decode(responseBody) as List<dynamic>;
    final List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts(int page) async {
    const int page = 1;
    final reponse = await http
        .get(Uri.parse('$url?per_page=15&page=$page'))
        .timeout(const Duration(seconds: 10));
    if (reponse.statusCode == 200) {
      return compute(parsePost, reponse.body);
    } else if (reponse.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}

Future<String> getUrlImage(String limkapilayhinh) async {
  // ket noi api de lay url
  final reponse = await http
      .get(Uri.parse(limkapilayhinh))
      .timeout(const Duration(seconds: 10));
  if (reponse.statusCode == 200) {
    // tra ket qua return url hinh
    final jsonresponse = json.decode(reponse.body);
    final hinh = jsonresponse['link'];
    return hinh;
  } else if (reponse.statusCode == 404) {
    throw Exception('Not Found');
  } else {
    throw Exception('Can\'t get post');
  }
}
