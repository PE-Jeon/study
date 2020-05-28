import 'package:flutter/material.dart';
import 'package:study/datamodels/user.dart';

import 'mysql_methods.dart';

class MySQLIO extends StatefulWidget {
  @override
  _MySQLIOState createState() => _MySQLIOState();
}

class _MySQLIOState extends State<MySQLIO> {
  bool _boolTest = true;
  int a = 0;

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<User>> users;
  String _userName;
  bool isUpdate = false;
  int userIdForUpdate;
  DBHelper dbHelper;
  final _userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshUserList();
  }

  refreshUserList() {
    setState(() {
      users = dbHelper.getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MySQL IO Page"),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter user Name';
                      }
                      if (value.trim() == "")
                        return "Only Space is Not Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _userName = value;
                    },
                    controller: _userNameController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.purple,
                                width: 2,
                                style: BorderStyle.solid)),
                        // hintText: "user Name",
                        labelText: "user Name",
                        icon: Icon(
                          Icons.business_center,
                          color: Colors.purple,
                        ),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        )),
                  ),
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.backup),
                      onPressed: () {
                        dbHelper.userQuery(_userNameController.text);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                  visible: _boolTest,
                  child: RaisedButton(
                    child: Text(_boolTest.toString()),
                    onPressed: null,
                  )),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  (isUpdate ? 'UPDATE' : 'ADD'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper.update(User(null, _userNameController.text)).then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    }
                  } else {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper.add(User(null, _userNameController.text));
                    }
                  }
                  _userNameController.text = '';
                  refreshUserList();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  (isUpdate ? 'CANCEL UPDATE' : 'CLEAR'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _userNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    userIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),


          Expanded(
            child: FutureBuilder(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return generateList(snapshot.data);
                }
                if (snapshot.data == null || snapshot.data.length == 0) {
                  return Text('No Data Found');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<User> users) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('NAME'),
            ),
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('DELETE'),
            ),
            DataColumn(
              label: Text('UID'),
            ),
          ],
          rows: users
              .map(
                (user) => DataRow(
                  cells: [
                    DataCell(
                      Text(user.middleName.toString()),
                      //Text("1"),
                      onTap: () {
                       // debugPrint("user.middleName = " + user.middleName);
                        setState(() {
                          isUpdate = true;
                          userIdForUpdate = user.id;
                        });
                        _userNameController.text = user.middleName;
                      },
                    ),
                    DataCell(
                      Text(user.id.toString()),
                      onTap: () {
                        a = user.id;
                        debugPrint("user.id.toString() = " + user.uid.toString());
                        print("direct print " + a.toString());
                      }
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dbHelper.delete(user.id);
                          refreshUserList();
                        },
                      ),
                    ),
                    DataCell(
                      Text((() {
                        if(user.uid==null) {
                          return "null";
                        }
                        return user.uid;
                      })()),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
