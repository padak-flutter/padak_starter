import "package:flutter/material.dart";

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
