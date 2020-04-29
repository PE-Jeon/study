import 'package:flutter/material.dart';
import 'package:study/crud/file/fileio.dart';
import 'package:study/ui/text/textEditingController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigation(),
      //home: FlutterDemo(storage: CounterStorage()),             //crud fileid.dart
      //home: MyHomePage(title: 'Flutter Demo Home Page'),      //default widget
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: null,
                    child: Text("CRUD"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button1"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button2"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button3"),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: null,
                    child: Text("CRUD"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button1"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button2"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button3"),
                  ),
                ],),
            ],
          ),
    ));
  }
}