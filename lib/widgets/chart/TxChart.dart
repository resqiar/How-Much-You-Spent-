import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/models/Transaction.dart';
import 'package:how_much_you_spent_app/widgets/chart/ChartBar.dart';
import 'package:intl/intl.dart';

class TxChart extends StatelessWidget {
  final List<Transaction> recentTx;

  TxChart(this.recentTx);

  List<Map<String, Object>> get groupedTxValues {
    return List.generate(7, (index) {
      // define days in a week
      final weekDays = DateTime.now().subtract(Duration(days: index));

      // total tx in a week
      var totalTx = 0.0;

      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].time.day == weekDays.day &&
            recentTx[i].time.month == weekDays.month &&
            recentTx[i].time.year == weekDays.year) {
          totalTx += recentTx[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDays), 'amount': totalTx};
    }).reversed.toList();
  }

  double get totalTX {
    return groupedTxValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 80) * 0.3,
      width: double.infinity,
      child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "How much you spend in a week?",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTxValues.map((value) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          value['day'],
                          value['amount'],
                          totalTX == 0
                              ? 0
                              : (value['amount'] as double) / totalTX),
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
    );
  }
}
