import 'package:cred/utils/theme.dart';
import 'package:flutter/material.dart';

import 'screens/select_credit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SelectCredit(),
    );
  }
}
