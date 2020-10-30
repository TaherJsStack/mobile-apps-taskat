import 'package:flutter/material.dart';

class SignSwitchPage extends StatefulWidget {
  SignSwitchPage({Key key}) : super(key: key);

  @override
  _SignSwitchPageState createState() => _SignSwitchPageState();
}

class _SignSwitchPageState extends State<SignSwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Flutter Scaffold'),
      // ),
      body: Padding(
      padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/logo.png", width: 100),
              ],
            ),),

            SizedBox(height: 20.0),

            Container(
              child: Text(
                "Travel App", 
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            ),
            Container(
              child: Text(
                "Travel App Travel App Travel App", 
                style: TextStyle(color: Colors.black, fontSize: 15),), 
              margin: EdgeInsets.only(top: 5.0),
            ),

            SizedBox(height: 30.0),

            Container(
              width: 230,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.blue)),
                textColor: Colors.white,
                child: Text('Sign Up'),
                color: Colors.blue,
                onPressed: () => {
                  Navigator.pushReplacementNamed(context, '/signUpPage'),
                  // Navigator.pushNamed(context, '/signUpPage')
                  print("what the fuck....")
                },
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: 230,
              height: 45,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.blue)),
                textColor: Colors.blue,
                child: Text('Sign In'),
                onPressed: () => {
                  // Navigator.pushReplacementNamed(context, '/signInPage')
                  Navigator.pushNamed(context, '/signInPage')
                },
              ),
            ),
          ],
        )
      )
    );
  }
}