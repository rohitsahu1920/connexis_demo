import 'package:connexis_demo/screens/first.dart';
import 'package:flutter/material.dart';
import 'package:connexis_demo/res/color.dart';
import 'package:connexis_demo/util/shared_pref_manager.dart';
import 'package:toast/toast.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String mobilenumber = "";
  String password = "";
  bool _obscureText = true;
  bool checkValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async{
    if( await SharedPrefManager.getBool(keyIsLoggedIn) == true ){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => first()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            padding: EdgeInsets.all(40),
            child: Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      child: Image.asset('assets/White-Horizontal.png',
                          width: 200, height: 200),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  TextFormField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    onChanged: (value) => mobilenumber = value,
                    validator: (value) {
                      if (mobilenumber.trim().length < 10) {
                        return 'Enter Mobile Number.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Mobile Number",
                        hintStyle: TextStyle(fontSize: 13.0),
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    autofocus: false,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Password",
                        suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: new Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 13.0,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print("Pressed  321  654  987");
                          signIn();
                        },
                        color: colorPrimary),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  signIn() async {
    if(await mobilenumber != "" && password != ""){
      SharedPrefManager.setBool(keyIsLoggedIn, true);
      SharedPrefManager.setString(keyContactNo, mobilenumber);
      SharedPrefManager.setString(keyPassword, password);
      Toast.show("values ${mobilenumber} and ${password}", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => first()),
      );
    }
    else{
      Toast.show("Please Enter Right input", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

}
