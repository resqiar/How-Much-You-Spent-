import 'package:flutter/material.dart';

class TxChart extends StatefulWidget {
  @override
  _TxChartState createState() => _TxChartState();
}

class _TxChartState extends State<TxChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
