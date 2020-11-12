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
  final List<Transaction> txHistory = []; // initiate arrays

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
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              child: Card(
                child: Text(
                  'TX MOCKUP',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}
