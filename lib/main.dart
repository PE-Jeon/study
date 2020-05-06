import 'package:flutter/material.dart';
import 'package:study/crud/bloc/blocio.dart';
import 'package:study/crud/cache/cache.dart';
import 'package:study/crud/file/fileio.dart';
import 'package:study/crud/mysql/mysql.dart';
import 'package:study/crud/provider/provider.dart';
import 'crud/crudMain.dart';
import 'crud/firebase/firebase.dart';
import 'functiontest/accountpermission/accountpermission.dart';
import 'functiontest/testMain.dart';

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
      initialRoute: '/',
      routes: {
        //Main Page
        '/' : (context) => Navigation(),



        //First Layers
        '/crudMain' : (context) => CRUDMain(),
        '/test': (context) => FunctionTest(),

        //Second Layers
        '/crudMain/BLOCIO' : (context) => BOLCIO(),
        '/crudMain/CacheIO' : (context) => CacheIO(),
        '/crudMain/FileIO' : (context) => FileIO(storage: CounterStorage()),
        '/crudMain/FirebaseIO' : (context) => FirebaseIO(),
        '/crudMain/MySQLIO' : (context) => MySQLIO(),
        '/crudMain/ProviderIO' : (context) => ProviderIO(),

        '/test/AccountPermission' : (context) => AccountPermission(),



      }

      //home: Navigation(),
      //home: FlutterDemo(storage: CounterStorage()),             //crud fileio.dart
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain');
                    },
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button4"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button5"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button6"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: Text("Function Test"),
                  ),
                ],),
            ],
          ),
    ));
  }
}
