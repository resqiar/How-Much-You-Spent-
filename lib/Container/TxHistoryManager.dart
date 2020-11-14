import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/models/Transaction.dart';
import 'package:how_much_you_spent_app/widgets/TxList.dart';
import 'package:how_much_you_spent_app/widgets/TxNew.dart';

class TxHistoryManager extends StatefulWidget {
  @override
  _TxHistoryManagerState createState() => _TxHistoryManagerState();
}

class _TxHistoryManagerState extends State<TxHistoryManager> {
  // DUMMY DATA
  final List<Transaction> _txHistory = [
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
    return Column(
      children: [
        TxNew(),
        TxList(_txHistory),
      ],
    );
  }
}
