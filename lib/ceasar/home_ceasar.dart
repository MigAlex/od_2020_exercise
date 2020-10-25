import 'package:flutter/material.dart';

class HomeCeasar extends StatefulWidget {
  @override
  _HomeCeasarState createState() => _HomeCeasarState();
}

class _HomeCeasarState extends State<HomeCeasar> {
  var _wordController = TextEditingController();
  var _keyController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Szyfrowanie Cezara')),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'plaintext/kryptogram'),
                  controller: _wordController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(hintText: 'klucz szyfrowania'),
                  controller: _keyController,
                  keyboardType: TextInputType.number,
                  
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RaisedButton(
                      child: Text('Zaszyfruj'),
                      onPressed: () {
                        this._process(true);
                      },
                    ),
                    RaisedButton(
                      child: Text('Odszyfruj'),
                      onPressed: () {
                        this._process(false);
                      },
                    ),
                    RaisedButton(
                      child: Text('Wykasuj'),
                      onPressed: _delete,
                      color: Colors.red,
                    )
                  ],
                ),
                SizedBox(height: 42),
                Text(
                  'Output:',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                SelectableText(
                  _result,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _process(bool _isEncrypt) {
    String _text = _wordController.text;
    int _key;
    String _temp = "";

    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      _showAlert("Nieprawidłowy klucz - przesunięcie musi być intem");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        _showAlert("Nieprawidłowy tekst");
        _temp = "";
        break;
      }

      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26;
      } else {
        c = (ch - _key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }

    setState(() {
      _result = _temp;
    });
  }

  void _delete() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      _result = "";
    });
  }

  Future _showAlert(String _alert) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Coś się skaszaniło'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(_alert),
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Oki doki'),
            ),
          ],
        );
      },
    );
  }
}
