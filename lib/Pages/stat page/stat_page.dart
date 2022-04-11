import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_budget/Pages/stat%20page/graph_container.dart';
import 'package:my_budget/Pages/stat%20page/month_layout.dart';
import 'package:my_budget/Widgets/chart.dart';
import 'package:my_budget/json/day_month.dart';
import 'package:my_budget/theme/colors.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

//   @override
//   _StatsPageState createState() => _StatsPageState();
// }

// class _StatsPageState extends State<StatsPage> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: grey.withOpacity(0.5),
      body: getBody(size),
    );
  }

  Widget getBody(Size size) {
      
    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": white,
        "label": "Income",
        "cost": "Rs " + 130.toString(),
      },
      {
        "icon": Icons.arrow_forward,
        "color": white,
        "label": "Expense",
        "cost": "Rs " + 150.toString(),
      }
    ];

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFFF3D00).withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [ 
                BoxShadow(
                    color: grey.withOpacity(0.09),
                    spreadRadius: 4,
                    blurRadius: 4),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 20, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Stats",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.yellow),
                    ),
                    Icon(
                      Ionicons.md_search,
                      size: 29,
                      color: Colors.yellow,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const MonthLayout(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding (
          padding:  EdgeInsets.only(left: 20, right: 20),
          child: GraphContainer(),
        ),
        const SizedBox(
          height: 17,
        ),
        Wrap(
          spacing: 20,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(expenses.length, (index) {
                  return Container(
                    width: (size.width - 60) / 2,
                    height: 180,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(
                              expenses[index]['icon'],
                              color: expenses[index]['color'],
                              size: 45,
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  expenses[index]['label'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  expenses[index]['cost'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
          ],
        )
      ]),
    );
  }
}
