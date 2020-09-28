import 'package:flutter/material.dart';

class MoviesDetailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies detail',
      home: MoviesAppFull(),
    );
  }
}

class MoviesAppFull extends StatefulWidget {
  MoviesAppFull({Key key}) : super(key: key);

  @override
  _MoviesAppState createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesAppFull> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 92, 161, 1)

          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
                  child: Text(
                      'Hello, What do you want to watch ? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),

                  )
              )
            ],
          ),
        )
      )
    );
  }
}
