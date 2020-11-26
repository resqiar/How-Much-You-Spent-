import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String date;
  final double amount;
  final double amountPercentage;

  ChartBar(this.date, this.amount, this.amountPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue, width: 0.5),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: amountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        FittedBox(
          child: Text('\$${amount.toStringAsFixed(0)}'),
        ),
      ],
    );
  }
}
