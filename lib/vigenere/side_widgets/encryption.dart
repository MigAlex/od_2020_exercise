import 'package:flutter/material.dart';
import 'package:od_2020_exercise/vigenere/cipher_v.dart';

class Encryption extends StatefulWidget {
  @override
  _EncryptionState createState() => _EncryptionState();
}

class _EncryptionState extends State<Encryption> {
  final _plainText = TextEditingController();
  final _keyValue = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Szyfrowanie')),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 32),
              Text('Szyfrowanie'),
              Container(
                width: double.infinity,
                child: TextField(
                  controller: _plainText,
                  decoration:
                      InputDecoration(labelText: 'tekst do szyfrowania'),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                child: TextField(
                  controller: _keyValue,
                  decoration:
                      InputDecoration(labelText: 'klucz do szyfrowania'),
                ),
              ),
              FlatButton(onPressed: _cipher, child: Text('Szyfruj')),
              EncryptionResult(result: _result),
            ],
          ),
        ),
      ),
    );
  }

  void _cipher() {
    var offset = _keyValue.text;
    var text = _plainText.text;
    VigenereCipher _vigenereCipher = VigenereCipher(offset);
    _result = _vigenereCipher.encrypt(text);
    setState(() {});
  }
}

class EncryptionResult extends StatelessWidget {
  final String result;

  EncryptionResult({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text('Output: '),
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
