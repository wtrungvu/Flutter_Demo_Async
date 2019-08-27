import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Async',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo Async"),
          ),
          body: Center(
            child: FutureWidget(),
          ),
        ));
  }
}

class FutureWidget extends StatefulWidget {
  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.redAccent,
            onPressed: () {
              getAge().then((value) {
                print(value); // print result is: 69
              });
            },
            child: Text("Push me"),
          )
        ],
      ),
    );
  }
}

Future<void> asyncMethod() {
  return Future.delayed(
      Duration(seconds: 3), () => print("asyncMethod is called!!!"));
}

// Integer Number
Future<int> delayNumber() {
  return Future.delayed(Duration(seconds: 3), () => 100);
}

Future<int> getAge() {
  final completer = Completer<int>();
  Future.delayed(Duration(seconds: 3), () {
    completer.complete(69);
  });
  return completer.future;
}
