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
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Item()))
              .then((value) => {
                    setState(() {
                      todos.add(value.toString());
                    })
                  });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${index + 1} - ${todos[index]}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 2.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final formKey = GlobalKey<FormState>();
  final controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controllerText,
                  onSaved: (value) {
                    controllerText.text = value;
                  },
                  validator: (valeu) {
                    if (valeu.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();

                      Navigator.of(context).pop(controllerText.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
