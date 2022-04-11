import 'package:flutter/material.dart';
import 'package:my_budget/provider/day_date.dart';
import 'package:my_budget/provider/month_yr.dart';
import 'package:my_budget/provider/root_provider.dart';
import 'package:my_budget/provider/total_budgetlist.dart';
import 'package:my_budget/second.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DailyPageProvider()),
      ChangeNotifierProvider(create: (_) => DateAndDayProvider()),
      ChangeNotifierProvider(create: (_) => MonthAndYear()),
      ChangeNotifierProvider(create: (_) => PageIndexProvider()),
      ChangeNotifierProvider(create: (_) => DateIndex()),
      ChangeNotifierProvider(create: (_) => MonthIndex()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SecondPage());
  }
}
