import 'dart:io';

class Post {
  String titulo;
  String conteudo;
  File? imagem;

  Post(this.titulo, this.conteudo, {this.imagem});
}
