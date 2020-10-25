import '../cipher_v.dart';
import 'package:flutter/material.dart';

class Decryption extends StatefulWidget {
  @override
  _DecryptionState createState() => _DecryptionState();
}

class _DecryptionState extends State<Decryption> {
  final _plainText = TextEditingController();
  final _keyValue = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vigenere Decryption')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Container(child: Text('Decryption')),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _plainText,
                    decoration:
                        InputDecoration(labelText: 'Tekst do odszyfrowania'),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _keyValue,
                    decoration: InputDecoration(labelText: 'Wartość klucza'),
                  ),
                ),
              ),
              FlatButton(
                onPressed: _cipher,
                child: Text('Odszyfruj'),
                color: Colors.green,
              ),
              DecryptionResult(result: _result),
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
    _result = _vigenereCipher.decrypt(text);
    setState(() {});
  }
}

class DecryptionResult extends StatelessWidget {
  final String result;

  const DecryptionResult({Key key, this.result}) : super(key: key);
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
