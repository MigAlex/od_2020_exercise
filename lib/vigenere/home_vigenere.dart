import 'package:flutter/material.dart';
import 'cipher_v.dart';

class HomeVigenere extends StatefulWidget {
  @override
  _HomeVigenereState createState() => _HomeVigenereState();
}

class _HomeVigenereState extends State<HomeVigenere> {
  final _plainText = TextEditingController();
  final _keyValue = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vigenere')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _plainText,
                  decoration: InputDecoration(
                      hintText: 'Plaintext/kryptogram',
                      icon: Icon(Icons.login)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    controller: _keyValue,
                    decoration: InputDecoration(
                        hintText: 'klucz szyfrowania',
                        icon: Icon(Icons.vpn_key))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: _encrypt,
                    child: Text('Zaszyfruj'),
                  ),
                  RaisedButton(
                    onPressed: _decrypt,
                    child: Text('Odszyfruj'),
                  ),
                  RaisedButton(
                    onPressed: _delete,
                    child: Text('Wykasuj'),
                    color: Colors.red,
                  ),
                ],
              ),
              CryptionResult(result: _result),
            ],
          ),
        ),
      ),
    );
  }

  void _decrypt() {
    var offset = _keyValue.text;
    var text = _plainText.text;
    if (offset.length != text.length) {
      _showAlert('Klucz musi być tej samej długości co plaintext/szyfrogram');
    }
    VigenereCipher _vigenereCipher = VigenereCipher(offset);
    _result = _vigenereCipher.decrypt(text);
    setState(() {});
  }

  void _encrypt() {
    var offset = _keyValue.text;
    var text = _plainText.text;
    if (offset.length != text.length) {
      _showAlert('Klucz musi być tej samej długości co plaintext/szyfrogram');
    }
    VigenereCipher _vigenereCipher = VigenereCipher(offset);
    _result = _vigenereCipher.encrypt(text);
    setState(() {});
  }

  void _delete() {
    _plainText.clear();
    _keyValue.clear();
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
                setState(() {
                  _keyValue.clear();
                  _plainText.clear();
                  _result = "";
                });
              },
              child: Text('Oki doki'),
            ),
          ],
        );
      },
    );
  }
}

class CryptionResult extends StatelessWidget {
  final String result;

  const CryptionResult({Key key, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text('Output: ',
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
          Container(
            child: Text(
              result,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
