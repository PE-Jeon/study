import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study/datamodels/user.dart';
import 'package:study/functiontest/widgets/popUp.dart';

Widget wgCardUser(BuildContext context, User user) {

  String _email = user.email;
  String _uid = user.uid;
  String _name = user.middleName;
  String _position = user.position;
  String _company = user.company;
  String _division = user.division;
  String _department = user.department;
  String _team = user.team;

  //debugPrint("Debug: _uid = " + _uid.toString());
  //debugPrint("Debug: user.uid = " + user.uid.toString());


  return Container(
    child: Center(
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: () {
                pupUp(context, _uid, _name);
              },
              leading: Icon(Icons.album),
              title: Text(_company + " " +  _name + " " +  _position),
              subtitle: Text(_division + " " +  _department + " " +  _team),
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
  );
}
