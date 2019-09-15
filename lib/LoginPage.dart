import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:sanraforceadmin/home_page.dart';

class MyAppLogin extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanra',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.green,
      ),
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyLoginPage> {
  final myUserNameController = TextEditingController();
  final myPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var localContext = context;
    var assetImage = new AssetImage('assets/logo.png');
    var image = new Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: image,
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Please Enter Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Please Enter Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.lightGreen.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if (_validate()) {
              if(myUserNameController.text.toString() == "atchyutmaddukuri@gmail.com" && myPasswordController.text.toString() == "Jamesbond_007"){
                Navigator.push(

                    context, MaterialPageRoute(builder: (context) => HomePage()));
              }
            } else {
              _showToast("Please enter valid inputs");
            }

            /* Navigator.push(

                context, MaterialPageRoute(builder: (context) => HomePage()));*/
          },
          color: Colors.green,
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );




    return Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (mycontext) => Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
              children: <Widget>[
                logo,
                SizedBox(height: 50.0),
                new TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String arg) {
                    if (arg == null || arg.trim() == null || arg.length == 0) {
                      _showToast("Please enter a valid input");
                    }
                  },
                  controller: myUserNameController,
                ),
                SizedBox(height: 20.0),
                new TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: myPasswordController,
                  validator: (String arg) {
                    if (arg == null || arg.trim() == null || arg.length == 0) {
                      _showToast("Please enter a valid input");
                    }
                  },
                ),
                SizedBox(height: 24.0),
                loginButton,
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //forgotPassword
                  ],
                ),
                //forgotLabel
              ],
            ),
          ),
        ));
  }

  void makeApiRequest(BuildContext localContext) {
    _showProgressDialog(localContext);
  }



  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myUserNameController.dispose();
    myPasswordController.dispose();
    super.dispose();
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

  validateUserName() {}

  bool _validate() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    if (!myUserNameController.text.isEmpty &&
        !myUserNameController.text.trim().isEmpty &&
        regExp.hasMatch(myUserNameController.text.toString())) {
      if (myPasswordController.text.isNotEmpty &&
          myPasswordController.text.trim().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  void _showProgressDialog(BuildContext localcontext) {
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
              new Text("Signing In..."),
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
