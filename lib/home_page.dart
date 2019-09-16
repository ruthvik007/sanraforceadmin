import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:sanraforceadmin/FieldReports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatelessWidget {
  String tag = 'home-page';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sanra',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: Category(),
    );
  }
}

class Category extends StatefulWidget {
  @override
  _MyCategoryForm createState() => _MyCategoryForm();
}

class _MyCategoryForm extends State<Category> {
  var localBuildContext;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    final card_list_four = new GestureDetector(
        child: Card(
          color: Colors.green,
          elevation: 5.0,
          child: SizedBox(
            height: 50.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new SizedBox(
                  height: 30,
                ),
                Text(
                  'Field Reports',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FieldReports()));
        });


    localBuildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
          children: <Widget>[
            SizedBox(height: 40.0),
            new GestureDetector(
              child: new Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                LogOut(context);
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            card_list_four
          ],
        ),
      ),
    );
  }




  void LogOut(BuildContext context) async {
    SharedPreferences prefsLocal = await SharedPreferences.getInstance();
    await prefsLocal.setString('user_id', null);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyLoginPage()));
  }

  @override
  void initState() {
    super.initState();
    print("init is called");

  }


  void _showProgressDialog(BuildContext localcontext, String text) {
    // flutter defined function
    showDialog(
      context: localcontext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              new Text(text),
              SizedBox(
                height: 20,
              ),
              new CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }


}


void _showToast(String msg) {
  print(msg);
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<File> _getFile(String path) async {
  print("step4");
  return File('$path');
}
