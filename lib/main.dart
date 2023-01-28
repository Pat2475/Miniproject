import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Selector',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Selector',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Pacifico')),
        ),
        body: InputForm(),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  String _inputText = '';
  String isEmpty = '';
  String Word = ' Please enter specific word "image"';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Text'),
              validator: (value) {
                if (value == null) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) => _inputText = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _showAlert(context, _inputText);
                }
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (text == 'image') {
          return AlertDialog(
            title: const Text('Select Image',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                    fontFamily: 'BebasNeue')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _showCat1Alert(context, 'images/Cat.jpeg'),
                  child: Text('Cat 1'),
                ),
                ElevatedButton(
                  onPressed: () => _showCat2Alert(context, 'images/cat.png'),
                  child: Text('Cat 2'),
                ),
                ElevatedButton(
                  onPressed: () => _showDog1Alert(context, 'images/image3.jpg'),
                  child: Text('Dog 1'),
                ),
                ElevatedButton(
                  onPressed: () => _showDog2Alert(context, 'images/image4.jpg'),
                  child: Text('Dog 2'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('EXIT'),
                ),
              ],
            ),
          );
        } else {
          return AlertDialog(
            title: Text('Entered Text'),
            content: Text(Word),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        }
      },
    );
  }

  void _showCat1Alert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cat Image',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'BebasNeue')),
          content: Image.asset('images/cat.png'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showCat2Alert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cat Image',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'BebasNeue')),
          content: Image.asset('images/Cat.jpeg'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showDog1Alert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dog Image',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'BebasNeue')),
          content: Image.asset('images/Dog1.jpeg'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showDog2Alert(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dog Image',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'BebasNeue')),
          content: Image.asset('images/Dog2.jpeg'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
