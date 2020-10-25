import 'package:flutter/material.dart';

import 'ceasar/home_ceasar.dart';
import 'vigenere/home_vigenere.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ochrona Danych 2020'),
        centerTitle: true,
      ),
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
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
                leading: Icon(Icons.search, color: Colors.black87),
                trailing: Icon(Icons.directions, color: Colors.black87),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeCeasar()));
                },
              ),
              ListTile(
                title: Text(
                  'Szyfrowanie Vigenere\'a',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                ),
                leading: Icon(Icons.search, color: Colors.black87),
                trailing: Icon(Icons.directions, color: Colors.black87),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeVigenere()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
