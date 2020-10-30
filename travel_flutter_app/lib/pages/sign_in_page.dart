import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final Map<String, dynamic> _formData = {
    'name': null,
    'email': null,
    'phone': null,
    'password': null,
    'confpassword': null,
    'acceptTerms': false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        _formData["email"] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'password',
        prefixIcon: Icon(Icons.lock),
      ),
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      obscureText: true,
      onChanged: (String value) {
        _formData["password"] = value;
      },
    );
  }

 void _registerForm() {
    // if (!_formKey.currentState.validate()) {
    //   return;
    // }
    // _formKey.currentState.save();
    // print(_formData);
    // register(_formData["name"], _formData["email"], _formData["phone"], _formData["password"]);
    Navigator.pushReplacementNamed(context, '/tabsPage');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.90;

    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Flutter Scaffold'),
      // ),
      // backgroundColor: Colors.green,
      body: 
      Stack(
        children: <Widget>[ 
          Container(
            height: 380,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.centerLeft,
                // end: Alignment.bottomRight,
                colors: [
                  Colors.blue[700],
                  Colors.blue[300],
                ],
              ),
            ),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[


                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/logo.png", width: 70),
                    ],
                  ),
                ),
                
                SizedBox(height: 10.0),

                Center(child: 
                  Container(
                    child: Text(
                      "Sign In", 
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
                
              ],
            ),
          ),

          Align(alignment: 
            Alignment(0, 1), 
            child:Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              height: 400,
              width: targetWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              // child: 
              child: Form(
                // key: _formKey,
                child:  ListView(
                children: <Widget>[
                  
                _buildEmailTextField(),
                
                _buildPasswordTextField(),
      
      
                SizedBox(
                  height: 30.5,
                ),
                    
                Container(
                  width: 230,
                  height: 45,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blue)),
                    textColor: Colors.white,
                    child: Text('Sign In'),
                    onPressed: () => { _registerForm() },
                  ),
                ),
              
                SizedBox(
                  height: 10.5,
                ),
              
                Container(
                  width: 230,
                  height: 45,
                  child: Row( 
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text('Sign Up With ', 
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Text(
                            ' Create New', 
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, 
                                fontSize: 12,
                              ),
                          ),
                            
                          color: Colors.transparent,
                          textColor: Colors.blue,
                          onPressed: () => { 
                            print("Sign Up page"),
                            Navigator.pushReplacementNamed(context, '/signUpPage')
                          },
                        ),

                      ),
                    ],
                  ),
                  
                ),


                ],
              ),
            ),
          )
          )
        ],
        
      )
    );
    
  }
}