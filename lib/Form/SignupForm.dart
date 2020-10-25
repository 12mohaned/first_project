import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  SignupForm createState() {
    return SignupForm();
  }
}

class SignupForm extends State<MyCustomForm> {
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
            'Enter your name',
            Icons.person,
            'Name',
          ),
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
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Data is in processing.')));
              }
            },
          )),
        ],
      ),
    )));
  }
}

class Authentication extends StatelessWidget {
  final String name;
  final IconData icon;
  final String label;
  const Authentication(this.name, this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (new TextField(
        decoration: new InputDecoration(
          hintText: name,
          icon: Icon(icon),
          labelText: label,
        ),
      )),
    );
  }
}
