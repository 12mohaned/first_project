import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Form/SignupForm.dart';
import 'Form/LoginForm.dart';

void main() {
  runApp(ChooseApp());
}

class ChooseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registeration',
        home: Scaffold(
          appBar: AppBar(
              title: Text('Registeration Form'),
              backgroundColor: Colors.orangeAccent),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/education_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: (Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Register('Register'),
                SizedBox(height: 28.0, width: 15.0),
                Login('Login'),
              ],
            )),
          ),
        ));
  }
}

class Register extends StatelessWidget {
  final String persona;
  const Register(this.persona);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.orangeAccent),
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: CupertinoButton(
            child: Text(persona,
                style: TextStyle(
                  color: Colors.black,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCustomForm()),
              );
            },
          ),
        ));
  }
}

class Login extends StatelessWidget {
  final String persona;
  const Login(this.persona);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.orangeAccent),
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: CupertinoButton(
            child: Text(persona,
                style: TextStyle(
                  color: Colors.black,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomForm()),
              );
            },
          ),
        ));
  }
}
