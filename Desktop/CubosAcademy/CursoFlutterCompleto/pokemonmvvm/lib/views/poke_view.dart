import 'package:flutter/material.dart';
import 'package:pokemonmvvm/controller/poke_controller.dart';
import 'package:pokemonmvvm/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<Pokemon>(
            stream: controller.streamLista.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data.imageUrl,
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(
                        snapshot.data.nome,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(snapshot.data.especie),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: ListView.builder(
                            itemCount: snapshot.data.abilities.length,
                            itemBuilder: (context, index) {
                              return Text(snapshot.data.abilities[index].name);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                );
              }
              return Container();
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: Text("Load Pokemon"),
          ),
        ],
      ),
    );
  }
}

class Abilidade extends StatelessWidget {
  final Ability abilidade;
  final int index;

  Abilidade(this.index, {this.abilidade, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: Text(
        "teste",
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
