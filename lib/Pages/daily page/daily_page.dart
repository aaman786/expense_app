import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_budget/Pages/daily%20page/budget_list.dart';
import 'package:my_budget/Pages/daily%20page/date_layout.dart';
import 'package:my_budget/provider/total_budgetlist.dart';

import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../theme/colors.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DailyPageProvider>().getTotal();

    String? total =
        context.watch<DailyPageProvider>().totalForDailyPage!.toStringAsFixed(2);

    return Scaffold(
      backgroundColor: grey.withOpacity(0.37),
      body: ChangeNotifierProvider<DailyPageProvider>(
        create: (_) => DailyPageProvider(),
        child: getBody(total: total),
      ),
    );
  }

  Widget getBody({required String total}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFF3D00).withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.09),
                      spreadRadius: 4,
                      blurRadius: 4),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: black),
                      ),
                      Icon(
                        Ionicons.md_search,
                        size: 27,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DateLayout(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: BudgetList(),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Overall Amount:-",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  total,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
