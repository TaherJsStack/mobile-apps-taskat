import 'package:flutter/material.dart';


class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];



  @override
  Widget build(BuildContext context) {
return Scaffold(
    appBar: AppBar(
      // title: Text('Flutter Scaffold'),
    ),
    body: Container(
       child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ));
  }
}