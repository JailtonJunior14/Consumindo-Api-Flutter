import 'dart:convert';

import 'package:app/models/post_model.dart';
import 'package:http/http.dart' as http;

const url = "https://jsonplaceholder.typicode.com/posts";

class Api {
  Future<List<PostModel>> getAllPost() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        //retorna os post
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        List<PostModel> list = [];

        for (var n in json) {
          list.add(PostModel.fromJson(n));
        }

        return list;
      } else {
        print("getAllRows: StatusCode ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("getAllRows: StatusCode ${e.toString()}");
      return [];
    }
  }

  Future<bool> salvarPost(PostModel post) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: utf8.encode(jsonEncode(post.toJson()))
      );

      if (response.statusCode == 201) {
        print("salvarPost: StatusCode ${response.statusCode}");
        print("salvarPost: body ${response.body}");
        return true;
      } else{
        print("salvarPost: StatusCode ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("salvarPost: StatusCode ${e.toString()}");
      return false;
    }
  }

  Future<bool> alterarPost(PostModel post) async {
    try {
      http.Response response = await http.put(
        Uri.parse("$url/${post.id}"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: utf8.encode(jsonEncode(post.toJson()))
      );

      if (response.statusCode == 200) {
        print("alterarPost: StatusCode ${response.statusCode}");
        print("alterarPost: body ${response.body}");
        return true;
      } else{
        print("alterarPost: StatusCode ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("alterarPost: StatusCode ${e.toString()}");
      return false;
    }
  }

  Future<bool> deletarPost(int id) async {
    try {
      http.Response response = await http.delete(
        Uri.parse("$url/$id"),
      );

      if (response.statusCode == 200) {
        print("alterarPost: StatusCode ${response.statusCode}");
        print("alterarPost: body ${response.body}");
        return true;
      } else{
        print("alterarPost: StatusCode ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("alterarPost: StatusCode ${e.toString()}");
      return false;
    }
  }
}
