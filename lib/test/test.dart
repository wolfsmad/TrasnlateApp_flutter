import 'package:flutter/material.dart';

List<String> items = ['Item 1', 'Item 2', 'Item 3'];
List<String> isChecked = [];
//Initialized outside build
class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(body: ListView(
          children: <Widget>[
            ...items
                .map(
                  (item) => CheckboxListTile(
                    subtitle: Text('This is a subtitle'),
                    secondary: Text('This is Secondary text'),
                    title: Text(item),
                    value: isChecked.contains(item),
                    onChanged: (bool value) {
                      if (value) {
                        setState(() {
                          isChecked.add(item);
                        });
                      } else {
                        setState(() {
                          isChecked.remove(item);
                        });
                      }
                    },
                  ),
                )
                .toList()
          ],
        ),));}
}