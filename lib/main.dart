import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

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
      desc: 'I spent another 10 bucks to this shit',
      amount: 9.99,
      time: DateTime.now(),
    ),
    Transaction(
      id: '89asdwz1Xz',
      title: 'Street Burger',
      desc: 'Dang thats horribly wrong food!',
      amount: 9.99,
      time: DateTime.now(),
    ),
    Transaction(
      id: '89asdwz1Xz',
      title: 'Beggar Luck',
      desc: 'How can the town square full of beggar?',
      amount: 0.99,
      time: DateTime.now(),
    ),
    Transaction(
      id: '89asdwz1Xz',
      title: 'Another Street food',
      desc: 'This "Martabak" really made my day!',
      amount: 1.29,
      time: DateTime.now(),
    ),
    Transaction(
      id: '89asdwz1Xz',
      title: 'Indonesian "UBER"',
      desc: 'Their green jacket looks awesome!',
      amount: 1.69,
      time: DateTime.now(),
    ),
  ]; // initiate dummy arrays

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
          elevation: 4,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '-- TX Chart Should be Here --',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              child: Column(
                children: txHistory.map((tx) {
                  return Card(
                    elevation: 4,
                    // card
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            child: Text(
                              '\$${tx.amount.toString()}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .red, // this color will change later dynamically
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  tx.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  tx.desc,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  DateFormat().format(tx.time),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }
}
