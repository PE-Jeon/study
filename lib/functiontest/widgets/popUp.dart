import 'package:flutter/material.dart';

Widget pupUp(BuildContext context) {

  final _formKey = GlobalKey<FormState>();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -75.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close, color: Colors.white),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Sorry, you have no permission."),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Please contact to administrator."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: RaisedButton(
                        child: Text("Close", style: TextStyle(color: Colors.white)),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.of(context).pop();
                          /*if (_formKey.currentState
                              .validate()) {
                            _formKey.currentState.save();
                          }*/
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}