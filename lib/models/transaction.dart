import 'package:flutter/foundation.dart';
class Transaction {
  final String id;
  final String text;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.text,
    @required this.amount,
    @required this.date,});
}
