import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/models/Transaction.dart';
import 'package:intl/intl.dart';

class TxList extends StatelessWidget {
  final List<Transaction> transactions;

  TxList(this.transactions); // called from TxHistoryManager

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: Column(
        children: transactions.map((tx) {
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
    );
  }
}
