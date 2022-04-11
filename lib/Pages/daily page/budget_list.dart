import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:my_budget/json/daily_json.dart';
import 'package:my_budget/provider/total_budgetlist.dart';
import 'package:provider/provider.dart';
import '../../theme/colors.dart';
// import '../../json/daily_json.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({Key? key}) : super(key: key);

  String dateAndTimeFormat(String dateInString, String format) {
    DateTime parsedDate = DateTime.parse(dateInString);
    return DateFormat(format).format(parsedDate); //'EEE, MMM d, ' 'yy'
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<DailyPageProvider>(
      builder: (context, value, child) => Column(
        children: List.generate(daily.length, (index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFF3D00).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 14, top: 5, bottom: 5),
                      width: (size.width - 40) * 0.7,
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                color: white.withOpacity(0.2),
                                shape: BoxShape.circle),
                            child: Image.asset(daily[index]['icon'],
                                width: 30, height: 30),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: (size.width - 90) * 0.5,
                            child: Column(
                              children: [
                                Text(
                                  daily[index]['_name'].toString(),
                                  style: const TextStyle(
                                      fontSize: 18.6,
                                      color: black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dateAndTimeFormat(
                                      daily[index]['date'], 'h:mm a'),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightGreenAccent,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  dateAndTimeFormat(daily[index]['date'],
                                      'EEE, MMM d, ' 'yy'),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightGreenAccent,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      width: (size.width - 40) * 0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.end,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          const Text(
                            "Rs. ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: white,
                                fontSize: 16),
                          ),
                          Text(
                            daily[index]['price'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.blueGrey.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
            ],
          );
        }),
      ),
    );
  }
}
