import 'package:flutter/material.dart';
import 'package:od_2020_exercise/vigenere/home_vigenere.dart';
import 'package:od_2020_exercise/vigenere/side_widgets/decryption.dart';

import 'encryption.dart';

class HomeVigenere2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vigenere')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Encryption()));
                  },
                  child: Text('Szyfrowanie'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Decryption()));
                  },
                  child: Text('Odszyfrowanie'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeVigenere()));
                  },
                  child: Text('Razem'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
