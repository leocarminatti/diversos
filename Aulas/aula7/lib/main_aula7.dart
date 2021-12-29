import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Card {
  String title;
  Color cor;
  String url;

  Card(this.title, this.cor);
}

class _HomeState extends State<Home> {
  final List<Card> list = [
    Card('Text 1', Colors.red),
    Card('Text 2', Colors.blue),
    Card('Text 3', Colors.orange),
    Card('Text 4', Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                redirectToNewPage();
              },
              child: Container(
                color: list[index].cor,
                height: 300,
                width: 300,
                child: Text(
                  '$index - ${list[index].title}',
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void redirectToNewPage() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Cadastro(),
      ),
    )
        .then((value) {
      print(value);
      setState(() {
        frutas.add(value);
      });
    });
  }
}

class Cadastro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  onSaved: (value) {
                    emailController.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Esse campo é obrigatório!';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
                Divider(
                  height: 40,
                  thickness: 2.0,
                ),
                TextFormField(
                  controller: senhaController,
                  onSaved: (value) {
                    senhaController.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Esse campo é obrigatório!';
                    } else if (value.length < 6) {
                      return 'Esse campo deve ter no minimo 6 caracteres!';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Senha'),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Voltar'),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          Navigator.of(context).pop(emailController.text);
                        }
                      },
                      child: Text('Entrar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
