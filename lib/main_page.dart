import "package:flutter/material.dart";
import 'package:padak_starter/model/response/movie_response.dart';

import "./model/data/dummy.dart";

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text("Hello Flutter")
      ),
    );
  }
}
