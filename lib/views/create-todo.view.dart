import 'package:flutter/material.dart';
import 'package:todos/component/button.widget.dart';
import 'package:todos/widgets/user-card.widget.dart';

class CreateTodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Tarefa',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text(
                        "22/06/2020",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text('Alterar Data'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 20,
                bottom: 10,
              ),
              child: TDButtons(
                text: 'Salvar',
                width: double.infinity,
                callback: () {},
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
