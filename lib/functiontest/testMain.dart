import 'package:flutter/material.dart';

class FunctionTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Function Test Page"),
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
                      Navigator.pushNamed(context, '/test/AccountPermission');
                    },
                    child: Text("Account Permission Test"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/crudMain/MySQLIO');
                    },
                    child: Text("MySQL IO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/crudMain/FirebaseIO');
                    },
                    child: Text("Firebase IO"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/crudMain/CacheIO');
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
                      //Navigator.pushNamed(context, '/crudMain/ProviderIO');
                    },
                    child: Text("Provider"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/crudMain/BLOCIO');
                    },
                    child: Text("BLOC"),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text("Button6"),
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
