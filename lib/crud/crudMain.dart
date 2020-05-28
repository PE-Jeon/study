import 'package:flutter/material.dart';

class CRUDMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CRUDMain Page"),
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
                      Navigator.pushNamed(context, '/crudMain/FileIO');
                    },
                    child: Text("File IO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/MySQLIO');
                    },
                    child: Text("MySQL IO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/FirebaseIO');
                    },
                    child: Text("Firebase IO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/CacheIO');
                    },
                    child: Text("Cache IO"),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/ProviderIO');
                    },
                    child: Text("Provider"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/BLOCIO');
                    },
                    child: Text("BLOC"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudMain/TodoList');
                    },
                    child: Text("TodoList"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button7"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
