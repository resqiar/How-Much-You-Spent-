import 'package:flutter/material.dart';

import './models/Transaction.dart';

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
  ///
  /// TODO: Use Model to Store User's Submitted Data.
  ///
  final List<Transaction> txHistory = [
    Transaction(
      id: '89asdwz1Xz',
      title: 'Buy Udemy Courses',
      desc: 'I spent another 60 bucks to this shit',
      amount: 59.99,
      time: DateTime.now(),
    ),
  ]; // initiate dummy arrays

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              child: Card(
                child: Text(
                  'CHART MOCKUP',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: txHistory.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),
            )
          ],
        ));
  }
}
