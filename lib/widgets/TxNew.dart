import 'package:flutter/material.dart';

class TxNew extends StatefulWidget {
  // hold a given data
  final Function addTx;

  TxNew(this.addTx);
  @override
  _TxNewState createState() => _TxNewState();
}

class _TxNewState extends State<TxNew> {
  final titleController = TextEditingController();

  final descController = TextEditingController();

  final amountController = TextEditingController();

  void inputTx() {
    final titleInput = titleController.text;
    final descInput = descController.text;
    final amountInput = double.parse(amountController.text);

    if (titleInput.isEmpty || descInput.isEmpty || amountInput <= 0) return;

    widget.addTx(titleInput, descInput, amountInput);

    // close automatically after user input the data
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => inputTx,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Descriptions'),
                controller: descController,
                onSubmitted: (_) => inputTx,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => inputTx,
              ),
              FlatButton(
                onPressed: inputTx,
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
