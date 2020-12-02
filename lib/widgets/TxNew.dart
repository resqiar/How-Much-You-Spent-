import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // DateTime the user will besaved here
  DateTime pickedDateTime;

  void inputTx() {
    final titleInput = titleController.text;
    final descInput = descController.text;
    final amountInput = double.parse(amountController.text);

    if (titleInput.isEmpty || descInput.isEmpty || amountInput <= 0) return;

    widget.addTx(titleInput, descInput, amountInput, pickedDateTime);

    // close automatically after user input the data
    Navigator.of(context).pop();
  }

  void startDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;

      setState(() {
        pickedDateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      pickedDateTime == null
                          ? 'No date chosen'
                          : DateFormat.yMMMd().format(pickedDateTime),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: startDatePicker,
                    )
                  ],
                ),
                RaisedButton(
                  onPressed: inputTx,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
