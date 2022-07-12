import 'package:flutter_application_1/models/posts.dart';

class Resposta {
  int count;
  String? next;
  String? previous;
  List<Post> results;

  Resposta(this.count, this.next, this.previous, this.results);
}
