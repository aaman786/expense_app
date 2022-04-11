import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_budget/Pages/Overview%20page/month_layout.dart';
import 'package:my_budget/json/budget_json.dart';
import 'package:my_budget/theme/colors.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

//   @override
//   _OverviewState createState() => _OverviewState();
// }

// class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: grey.withOpacity(0.34), body: getBody(size));
  }

  Widget getBody(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
              padding: const EdgeInsets.only(
                  top: 60, bottom: 20, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Expenses Overview",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 27,
                            color: Colors.yellow),
                      ),
                      Icon(
                        Ionicons.md_search,
                        size: 35,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MonthLayout()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(budgetJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budgetJson[index]['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.brown),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  budgetJson[index]['price'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 08,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 03),
                                  child: Text(
                                    budgetJson[index]['label_percentage'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Colors.blueGrey.withOpacity(0.9)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 03),
                              child: Text(
                                "Rs. 10000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.indigo.withOpacity(0.9)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: size.width - 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              width: (size.width - 40) *
                                  budgetJson[index]['percentage'],
                              height: 4,
                              decoration: BoxDecoration(
                                color: budgetJson[index]['color'],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
