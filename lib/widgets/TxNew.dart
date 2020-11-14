import 'package:flutter/material.dart';

class TxNew extends StatelessWidget {
  // hold a given data
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final amountController = TextEditingController();

  // Function pointer from TxHistoryManager
  final Function addTx;

  TxNew(this.addTx); // constructor that called from TxHistorymanager

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
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Descriptions'),
                controller: descController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              FlatButton(
                onPressed: () {
                  addTx(
                    titleController.text,
                    descController.text,
                    double.parse(amountController.text),
                  );
                },
                child: Text(
                  'Add new',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
