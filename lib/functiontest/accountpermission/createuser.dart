import 'package:flutter/material.dart';
import 'package:study/crud/firebase/firebase_repository.dart';
import 'package:study/datamodels/user.dart';
import 'package:random_string/random_string.dart';

class createUser extends StatelessWidget {
  FirebaseRepo _firebaseRepo = FirebaseRepo();
  static String text;
  User user = User(null, text);
  String _uid = "0";

  final crEmail = TextEditingController();
  final crFirstName = TextEditingController();
  final crMiddleName = TextEditingController();
  final crLastName = TextEditingController();
  final crStatus = TextEditingController();
  final crPosition = TextEditingController();
  final crUid = TextEditingController();
  final crCompany = TextEditingController();
  final crDivision = TextEditingController();
  final crDepartment = TextEditingController();
  final crTeam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User Page"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crFirstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'firstName',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crMiddleName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'middleName',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crLastName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'lastName',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crStatus,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'status',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crPosition,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'position',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crUid,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'uid',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crCompany,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'company',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crDivision,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'division',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crDepartment,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'department',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextField(
                    controller: crTeam,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'team',
                    ),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {

              user.uid = _uid = randomAlphaNumeric(28);

            user.email="30";user.middleName="30";user.position="leader";user.company="tree";user.division="sales";user.department="research";user.team="policy";


              user.createDate = DateTime.now();
              user.lastModifiedDate = DateTime.now();
              _firebaseRepo.createUserToDb(user);

              /*return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has entered by using the
                    // TextEditingController.
                    content: Text(crEmail.text),
                  );
                },
              );*/
            },
            child: Text("show data"),
          ),
        ],
      ),
    );
  }
}
