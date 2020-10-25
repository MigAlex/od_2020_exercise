import 'package:flutter/material.dart';
import 'package:od_2020_exercise/ceasar/home_ceasar.dart';

import 'vigenere/home_vigenere.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}



class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wybierz Rodzaj Szyfrowania',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Szyfrowanie Cezara',
                  style:
                      TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeCeasar()));
              },
            ),
            ListTile(
              title: Text('Szyfrowanie Vigenere\'a',
                  style:
                      TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeVigenere()));
              },
            )
          ],
        ),
      )),
    );
  }
}



/*
          Tooltip(
            message: 'do Vigenere\'a',
            child: IconButton(
              icon: Icon(Icons.folder_open),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeVigenere()));
              },
            ),
          )
*/
