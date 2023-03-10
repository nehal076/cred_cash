import 'package:cred/route/router.dart';
import 'package:cred/utils/bloc/cred_cash_bloc.dart';
import 'package:cred/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter router = AppRouter();
    return BlocProvider(
      create: (context) => CredCashBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
