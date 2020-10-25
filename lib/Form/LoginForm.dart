import 'package:flutter/material.dart';
import 'SignupForm.dart';

class CustomForm extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

class LoginForm extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: (Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Authentication(
            'Enter your Email',
            Icons.email,
            'Email',
          ),
          Authentication(
            'Enter your Password',
            Icons.vpn_key,
            'Password',
          ),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () {},
          )),
        ],
      ),
    )));
  }
}
