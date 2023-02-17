import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

var indianRupeesFormat = NumberFormat.currency(
  locale: 'HI',
  symbol: '₹',
  decimalDigits: 0,
);

extension IntX on int {
  String formatNumber() {
    return indianRupeesFormat.format(this);
  }
}
