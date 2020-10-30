import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';


class RegisterPage extends StatefulWidget {

  final MainModel model;
  
  RegisterPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<RegisterPage> {

  final Map<String, dynamic> _formData = {
    'name': null,
    'email': null,
    'phone': null,
    'password': null,
    'confpassword': null,
    'acceptTerms': false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordlFocusNode = FocusNode();
  final _confpasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
      image: AssetImage('assets/signup.png'),
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'name',
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
      onChanged: (String value) {
        _formData["name"] = value;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'E-mail',
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
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        _formData["email"] = value;
      },
    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'Phone',
        filled: false,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.7),
        ),
      ),validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'phone invalid';
        }
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        _formData["phone"] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordTextController,
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
        border: new UnderlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.red
        )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.7),
        ),
        
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

  Widget _buildConformedPasswordTextField() {
    return TextFormField(

      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'confirm password',
        filled: false,
        fillColor: Colors.white,
        focusColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.7),
        ),
      ),
      validator: (String value) {
        if (_passwordTextController != value) {
          return "password does not match";
        }
      },
      obscureText: true,
      onChanged: (String value) {
        _formData["confpassword"] = value;
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      
      value: _formData["acceptTerms"],
      onChanged: (bool value) {
        setState(() {
          _formData["acceptTerms"] = value;
        });
      },
      title: Text('Accept Terms', style: TextStyle(color: Colors.white),),
    );
  }

  void _registerForm(Function register) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    register(_formData["name"], _formData["email"], _formData["phone"], _formData["password"]);
    Navigator.pushReplacementNamed(context, '/tabs');
  }

  void _loginForm() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('register'),
      // ),
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
                      height: 40.0,
                    ),
                    _buildNameTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPhoneTextField(),
                    SizedBox(
                      height: 10.5,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.5,
                    ),
                    _buildConformedPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScopedModelDescendant<MainModel>(
                        builder: (
                            BuildContext context, 
                            Widget child,
                            MainModel model) {
                            return RaisedButton(
                              textColor: Colors.white,
                              child: Text('regster'),
                              onPressed: () => _registerForm(model.register),
                            );
                          }
                        ),
                        SizedBox(width: 50), // give it width
                        Expanded(
                          child: RaisedButton(
                            textColor: Colors.white,
                            child: Text('Login'),
                            onPressed: _loginForm,
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
