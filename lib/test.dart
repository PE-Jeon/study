

import 'package:flutter/material.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test page"),
      ),
      body:
      Container(
        child: Center(
          child: Card(
            elevation: 10.0,
            margin: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  contentPadding: EdgeInsets.all(5.0),
                ),
                ButtonBar(
                  buttonMinWidth: 0.0,
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: const Icon(Icons.mode_edit),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Icon(Icons.cancel),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
