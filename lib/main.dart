import 'package:flutter/material.dart';
import 'package:padak_starter/model/movies_response.dart';

import 'model/data/dummy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: FutureBuilder(
            future: loadJsonObject(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final MoviesResponse data = snapshot.data;
                return Text(data.movies[0]["date"]);
              } else {
                return Text("");
              }
            },
          ),
        ),
      ),
    );
  }
}
