import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FileIO extends StatefulWidget {
  final CounterStorage storage;

  FileIO({Key key, @required this.storage}) : super(key: key);

  @override
  _FileIOState createState() => _FileIOState();
}

class _FileIOState extends State<FileIO> {
  int _counter;
  Text _txt = Text("default text");

  getValueFromtxt() {
    //var value = _txt.data;
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  Future<File> _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  Future<File> _initializeCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File IO Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_txt'),
            Text(
              'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          FloatingActionButton(
            heroTag: "Decrement",
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          FloatingActionButton(
            heroTag: "Remove",
            onPressed: _initializeCounter,
            tooltip: 'Remove',
            child: Icon(Icons.cancel),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
        ],
      ),
    );
  }
}