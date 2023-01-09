import 'package:flutter/material.dart';
import 'package:interintel/presentation/home_screen.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  static var dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    '99': '  Ninety-Nine',
    '900': '  Nine-hundred',
  };

  var sortedKeys = dictionary.values.toList()..sort();

  final sorted = Map.fromEntries(
    dictionary.entries.toList()
      ..sort(
            (e1, e2) => e1.key.compareTo(e2.key),
      ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  name: widget.name,
                  email: widget.email,
                  phone: widget.phone,
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: sorted.length,
          itemBuilder: (BuildContext context, int index) {
            String key = sorted.keys.elementAt(index);
            return new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Text("$key"),
                  title: new Text("${sorted[key]}"),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
