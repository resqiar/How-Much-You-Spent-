import 'package:flutter/material.dart';

class TxNew extends StatelessWidget {
  // hold a given data
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Descriptions'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
