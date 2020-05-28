import 'package:flutter/material.dart';
import 'package:study/functiontest/widgets/popUp.dart';

class AccountPermission extends StatefulWidget {
  @override
  _AccountPermissionState createState() => _AccountPermissionState();
}

class _AccountPermissionState extends State<AccountPermission> {
  int test = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account Permission test page"),
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
                        if (test == 0) {
                          Navigator.pushNamed(
                              context, '/funcTest/AccountPermission');
                        } else {
                          pupUp(context, "Sorry, you don't have a permission",
                              "Pelase contact to the Administrator");
                        }
                      },
                      child: Text("AccountPerm"),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/funcTest/AccountPermission/createUser');
                              },
                              child: Text("create user"),
                            ),
                            RaisedButton(
                              onPressed: () {
                              },
                              child: Text("create user2"),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                        Column(
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                              Navigator.pushNamed(context, '/funcTest/AccountPermission/userList');
                              },
                              child: Text("change to user1"),
                            ),
                            RaisedButton(
                              onPressed: () {
                              },
                              child: Text("change to user2"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ],
          ),
        ));
  }
}