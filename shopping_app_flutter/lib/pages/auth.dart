import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class AuthPage extends StatefulWidget {
  final MainModel model;
  
  AuthPage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
    final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/signin.png'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      // focusNode: _emailFocusNode,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: false,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.7),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onChanged: (String value) {
        _formData["email"] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      // focusNode: _passwordFocusNode,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        filled: false,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.7),
        ),
      ),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onChanged: (String value) {
        setState(() {
          _formData["password"] = value;
        });
      },
    );
  }

  // Widget _buildAcceptSwitch() {
  //   return SwitchListTile(
  //     value: _formData["acceptTerms"],
  //     onChanged: (bool value) {
  //       _formData["acceptTerms"] = value;
  //     },
  //     title: Text('Accept Terms', style: TextStyle(color: Colors.white),),
  //   );
  // }

  void _submitForm(Function login) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    login(_formData['email'], _formData['password']);
    
    print(_formData);

    // Navigator.pushReplacementNamed(context, '/tabs');
  }

  void _registerForm() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text('Login'),
      //     ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 90.0,
                  ),
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  // _buildAcceptSwitch(),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ScopedModelDescendant<MainModel>(
                      builder: (BuildContext context, Widget child, MainModel model) {
                        return RaisedButton(
                          textColor: Colors.white,
                          child: Text('LOGIN'),
                          onPressed: () => _submitForm(model.authenticate),
                        );
                      },
                    ),
                      SizedBox(width: 50), // give it width
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          child: Text('regster'),
                          onPressed: _registerForm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
