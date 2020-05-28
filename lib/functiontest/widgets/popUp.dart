import 'package:flutter/material.dart';

Widget pupUp(BuildContext context, String memo1, String memo2) {

  final _formKey = GlobalKey<FormState>();
  debugPrint("Debug: memo1 : " + memo1);
  debugPrint("Debug: memo2 : " + memo2);


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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(memo1, textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(memo2, textAlign: TextAlign.center,),
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