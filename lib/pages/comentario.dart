import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Coments extends StatefulWidget {
  const Coments({Key? key}) : super(key: key);

  @override
  State<Coments> createState() => _ComentsState();
}

class _ComentsState extends State<Coments> {
  bool selecionado = false;
  bool salvo = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
        child: Card(
      child: Column(children: [
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.account_circle),
                iconSize: 55,
                onPressed: () {}),
            Container(
                margin: EdgeInsets.all(10),
                child: Text("Usuário",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          ],
        ),
        Row(
          children: [Expanded(child: Image.asset("images/policial.png"))],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    selecionado = !selecionado;
                  });
                },
                icon: Icon(selecionado
                    ? Icons.thumb_up_alt_rounded
                    : Icons.thumb_up_alt_outlined)),
            IconButton(
                onPressed: () {
                  openDialog();
                },
                icon: Icon(Icons.comment_outlined)),
            IconButton(
                onPressed: () {
                  setState(() {
                    salvo = !salvo;
                  });
                  if (salvo) {
                    Fluttertoast.showToast(
                        msg: "Post Salvo!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.black);
                  }
                },
                icon: Icon(salvo ? Icons.bookmark : Icons.bookmark_outline)),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Descrição",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        Card(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.account_circle), onPressed: () {}),
                  Column(
                    children: [
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Usuário\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Comentário",
                        )
                      ]))
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Divider(color: Colors.grey),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.account_circle), onPressed: () {}),
                  Column(
                    children: [
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Usuário\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Comentario",
                        )
                      ]))
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Divider(color: Colors.grey),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.account_circle), onPressed: () {}),
                  Column(
                    children: [
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Usuário\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Comentário!",
                        )
                      ]))
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Divider(color: Colors.grey),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.account_circle), onPressed: () {}),
                  Column(
                    children: [
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Usuário\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Comentário",
                        )
                      ]))
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Divider(color: Colors.grey),
              ),
            ],
          ),
        ),
      ]),
    ));
  }

  buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 58, 2, 2),
          Color.fromARGB(255, 112, 0, 0)
        ])),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/brasao.png", height: 40),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Comentário"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Escreva um comentário"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Enviar"))
            ],
          ));
}
