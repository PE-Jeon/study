import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study/datamodels/user.dart';
import 'package:study/functiontest/widgets/wgCardUser.dart';

class userList extends StatefulWidget {
  @override
  _userListState createState() => _userListState();
}

class _userListState extends State<userList> {
  ScrollController _listScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List Page"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: getUserList(),
          )
        ],
      ),
    );
  }

  Widget getUserList() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("study_users")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            itemCount: snapshot.data.documents.length,
            reverse: false,
            controller: _listScrollController,
            itemBuilder: (context, index) {
              //debugPrint("debug: uid = " + snapshot.data.documents.);
              return userCard(snapshot.data.documents[index]);
            });

      }
    );
  }

  Widget userCard(DocumentSnapshot snapshot) {
    User _user = User.fromMap(snapshot.data);
    //debugPrint("Debug: _user.uid = " + _user.uid.toString());

    return wgCardUser(context, _user);
  }
}