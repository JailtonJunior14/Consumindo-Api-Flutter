import 'dart:convert';

import 'package:app/models/post_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<PostModel>> getAllPost() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts")
      );

      if (response.statusCode == 200) {
        //retorna os post
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        List<PostModel> list = [];

        for (var n in json) {
          list.add(PostModel.fromJson(n));
        }
      } else {
        print("getAllRows: StatusCode ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("getAllRows: StatusCode ${e.toString()}");
        return [];
    }
  }
}
