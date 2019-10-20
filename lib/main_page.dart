import "package:flutter/material.dart";
import 'package:padak_starter/model/data/dummys_repository.dart';
import 'package:padak_starter/model/response/movie_response.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(child: Text("Hello Flutter")),
    );
  }
}
