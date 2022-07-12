import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/posts.dart';
import 'pages/paginas.dart';
import 'package:flutter_application_1/variaveis_globais.dart';

main() {
  final api = Api();
  api.getPosts(posts);

  runApp(MainApp());

  // JwtToken.jwtToken();
  // getPosts();
  // print(lista);
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Telas(),
    );
  }
}
