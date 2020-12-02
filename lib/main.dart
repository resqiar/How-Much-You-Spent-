import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/widgets/chart/TxChart.dart';
import 'package:how_much_you_spent_app/widgets/TxList.dart';
import 'package:how_much_you_spent_app/widgets/TxNew.dart';

import 'models/Transaction.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // SHowing Modal Bottom Sheet
  void _startBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        builder: (_) {
          return TxNew(_addNewTx);
        });
  }

  // DUMMY DATA
  final List<Transaction> _txHistory = []; // initiate dummy arrays

  /// ! Method to save user data.
  void _addNewTx(
    String txTitle,
    String txDesc,
    double txAmount,
    DateTime txDate,
  ) {
    final newTx = Transaction(
        id: UniqueKey().toString(),
        title: txTitle,
        desc: txDesc,
        amount: txAmount,
        time: txDate);

    setState(() {
      _txHistory.add(newTx);
    });
  }

  // RECENT TX GETTER
  List<Transaction> get _recentTxGetter {
    return _txHistory.where((tx) {
      return tx.time.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  //! Delete Tx
  void deleteTx(String id) {
    setState(() {
      _txHistory.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
          elevation: 4,
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _startBottomSheet(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TxChart(_recentTxGetter),
              SizedBox(height: 8),
              Text(
                "Transaction's History",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              TxList(
                _txHistory,
                deleteTx,
              ), // Manager to maintain History widget
            ],
          ),
        ));
  }
}
