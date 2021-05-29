import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  String name = ''; //valor vazio
  String sobreNome = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              margin: EdgeInsets.all(20),
              constraints: BoxConstraints(
                maxHeight: 800,
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Nome é obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Nome'),
                        onChanged: (text) {
                          name = text; //recebe o valor
                        },
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Sobrenome é obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Sobrenome'),
                        onChanged: (text) {
                          sobreNome = text;
                        },
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState.validate();
                          if (isValid) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Olá $name $sobreNome'),
                                    actions: [],
                                  );
                                });
                          }
                        },
                        child: Text('Validar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * border: Border.fromBorderSide(BorderSide(
          color: borderColor,
        )),
 */
