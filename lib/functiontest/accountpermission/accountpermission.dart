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
                              context, '/test/AccountPermission');
                        } else {
                          pupUp(context);
                        }
                      },
                      child: Text("AccountPerm"),
                    ),
                  ]),
            ],
          ),
        ));
  }
}