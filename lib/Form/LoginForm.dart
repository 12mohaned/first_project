import 'package:flutter/material.dart';
import 'package:first_project/Home/available_courses.dart';

class CustomForm extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class LoginForm extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    Widget _buildEmail() {
      return TextFormField(
          decoration: new InputDecoration(
            hintText: 'Email',
            icon: Icon(Icons.mail),
            labelText: 'Email',
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email' + ' is Required';
            }
            if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return 'Email Format is not correct';
            }
            return null;
          },
          onSaved: (String value) {
            _email = value;
          });
    }

    Widget _buildPassword() {
      return TextFormField(
          decoration: new InputDecoration(
            hintText: 'Password',
            icon: Icon(Icons.vpn_key),
            labelText: 'Password',
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password' + ' is Required';
            }
            return null;
          },
          onSaved: (String value) {
            _password = value;
          });
    }

    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: (Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildEmail(),
          _buildPassword(),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseApp()),
                );
              } else {}
            },
          )),
        ],
      ),
    )));
  }
}
