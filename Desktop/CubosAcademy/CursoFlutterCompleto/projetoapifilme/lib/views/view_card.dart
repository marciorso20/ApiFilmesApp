import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lançamentos"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Container(
                    child: Image.network(
                      "http://lojasaraiva.vteximg.com.br/arquivos/ids/12109083/1006637057.jpg?v=637142248087230000",
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Column(
                    children: [
                      Text("Teste1"),
                      Text("Teste2"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 *  Row(
              children: [
                Container(
                  child: Image.network(
                    "http://lojasaraiva.vteximg.com.br/arquivos/ids/12109083/1006637057.jpg?v=637142248087230000",
                    height: 300,
                    width: 300,
                  ),
                ),
                Column(
                  children: [
                    Text("Teste1"),
                    Text("Teste2"),
                  ],
                )
              ],
            ),
 */
