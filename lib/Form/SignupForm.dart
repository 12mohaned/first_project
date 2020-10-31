import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/Home/available_courses.dart';

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class MyCustomForm extends StatefulWidget {
  @override
  SignupForm createState() {
    return SignupForm();
  }
}

class SignupForm extends State<MyCustomForm> {
  String _name;
  String _password;
  String _email;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildName() {
      return TextFormField(
          decoration: new InputDecoration(
            hintText: 'Name',
            icon: Icon(Icons.person),
            labelText: 'Name',
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Name' + ' is Required';
            }
            return null;
          },
          onSaved: (String value) {
            _name = value;
          });
    }

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
          _buildName(),
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
