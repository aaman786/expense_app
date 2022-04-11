// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:my_budget/provider/day_date.dart';
import 'package:my_budget/provider/month_yr.dart';
import 'package:my_budget/provider/total_budgetlist.dart';
import 'package:provider/src/provider.dart';
import '_root_app.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  
    void getEntry() async {
    // context.read<DailyPageProvider>().getEntriesNew();
    context.read<DailyPageProvider>().getEntryProvider();
    
    // await Future.delayed(const Duration(seconds: 3));

    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (BuildContext context) => const RootApp()));
  }

  void getDaysAndDate() {
    context.read<DateAndDayProvider>().dateAndDayIntoMap();
  }

  void getMonthAndYear() {
    context.read<MonthAndYear>().getMonthsAndYear();
  }

  @override
  void initState() {
    getEntry();
    getDaysAndDate();
    getMonthAndYear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const RootApp();
  }
}
