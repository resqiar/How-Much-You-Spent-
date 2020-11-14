import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/Container/TxHistoryManager.dart';
import 'package:how_much_you_spent_app/widgets/TxChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summary',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
          elevation: 4,
        ),
        body: Column(
          children: <Widget>[
            //TxChart(),
            TxHistoryManager(), // Manager to maintain History widget
          ],
        ));
  }
}
