import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projetoapifilme/controller/controller_movie.dart';
import 'package:projetoapifilme/filmes.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MovieController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lançamentos"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: Container(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<Filme>(
                future: controller.movie,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Column(
                      children: [
                        Text(
                          'Loading...',
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  bottom: -10,
                                  right: 33,
                                  child: Container(
                                    height: 60,
                                    width: 300,
                                    padding: EdgeInsets.all(4),
                                    alignment: Alignment.center,
                                    color: Colors.black38,
                                    child: Text(
                                      snapshot.data.results[index].title,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(25),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w300" +
                                          snapshot
                                              .data.results[index].posterPath,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 40,
                                  top: 35,
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    alignment: Alignment.center,
                                    color: Colors.black38,
                                    child: Text(
                                      snapshot.data.results[index].releaseDate,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
