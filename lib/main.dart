import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:sanraforceadmin/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanraforceadmin/home_page.dart';
import 'LoginPage.dart';

void main() {
  Widget _defaultHome = new SplashScreen();



  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new HomePage(),
      '/login': (BuildContext context) => new MyLoginPage()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool result = false;

  startTime() async {

    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefsLocal = await SharedPreferences.getInstance();
    String user_id = await prefsLocal.get('user_id');
    if (user_id != null && user_id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void navigationPage() async {

    bool _result = await isLoggedIn();
    if (_result) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage('assets/logo.png');
    return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: assetImage,
                width: 150.0,
                height: 150.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
              ),
              new Text(
                'Let\'s grow together',
                style: TextStyle(
                    color: Colors.black, fontStyle: FontStyle.normal, fontSize: 20),
              )
            ],
          ),
        ));
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

}

// This widget is the root of your application.
