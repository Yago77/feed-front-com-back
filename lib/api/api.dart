import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/posts.dart';

class Api {
  Future<String?> login() async {
    try {
      String dados =
          jsonEncode({"username": "front", "password": "wPt7(;JQs^w6}G,j"});
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/auth/login/'),
              headers: {
                "Content-Type": "application/json",
              },
              body: dados);

      String jwt = jsonDecode(response.body)["access"];
      return jwt;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Post>?> getPosts(List<Post> listaPost) async {
    try {
      String? token = await login();
      var response = await http.get(Uri.parse('http://10.0.2.2:8000/'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      Map<String, dynamic> jDecode = jsonDecode(response.body);

      for (Map<String, dynamic> map in jDecode['results']) {
        var post = Post(
          map['title'],
          map['conteudo'],
          // map['image'],
        );
        // print(post.titulo);
        listaPost.add(post);
      }
      return listaPost;
    } catch (e) {
      print(e);
      // return null;
    }
  }

  Future<Post?> criaPost(String titulo, String conteudo) async {
    String title = titulo;
    String content = conteudo;

    try {
      String? token = await login();
      String dados = jsonEncode({"title": '$title', "conteudo": '$content'});
      var response = await http.post(Uri.parse('http://10.0.2.2:8000/create/'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: dados);
      Map<String, dynamic> jDecode = jsonDecode(response.body);
      Post novoPost = new Post(jDecode['title'], jDecode['conteudo']);
      return novoPost;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
