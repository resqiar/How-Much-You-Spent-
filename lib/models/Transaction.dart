import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final String desc;
  final double amount;
  final DateTime time;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.desc,
      @required this.amount,
      @required this.time});
}
