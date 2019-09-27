import 'package:flutter/material.dart';

import 'model/data/dummy.dart';
import 'model/getMoviesResponse.dart';

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
              child: Text(getJsonObjectByStr(getDummy()).movies[0]['date']))),
    );
  }
}

//class MainPage extends StatelessWidget {
//  MainPage({this.title}) : super();
//  final String title;
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: Center(
//          child: Text(
//            'Hello Flutter',
//          )
//      ),
//    );
//  }
//}
