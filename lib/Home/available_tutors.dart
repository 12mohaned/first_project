import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tutor extends StatelessWidget {
  final String name;
  final String biography;
  final String email;
  const Tutor(this.name, this.biography, this.email);
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text('Available Tutors'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: (Center(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("images/EducationBackground_Preview_03.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: (Card(
                margin: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                    SizedBox(width: 10, height: 18),
                    Text(biography,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CupertinoButton(
                          child: const Text(
                            'Reserve',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          onPressed: () {
                            print(name);
                          },
                        ),
                        SizedBox(),
                        const SizedBox(width: 8),
                        CupertinoButton(
                          child: const Text('Send mail',
                              style: TextStyle(
                                color: Colors.orangeAccent,
                              )),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ))),
        ))));
  }
}
