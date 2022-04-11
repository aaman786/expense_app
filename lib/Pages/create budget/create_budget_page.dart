import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:my_budget/json/create_budget_json.dart';
import 'package:my_budget/json/daily_json.dart';
import 'package:my_budget/local%20db/database_helper.dart';
import 'package:my_budget/local%20db/model/db_model.dart';
import 'package:my_budget/provider/day_date.dart';
import 'package:my_budget/provider/month_yr.dart';
import '../../theme/colors.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({Key? key}) : super(key: key);

  @override
  CcreateBudgetStatePage createState() => CcreateBudgetStatePage();
}

class CcreateBudgetStatePage extends State<CreateBudgetPage> {
  int activeCategory = 0;
  final TextEditingController _budgetName =
      TextEditingController(text: "charity");
  final TextEditingController _budgetAmount =
      TextEditingController(text: "100");

  addNewEntry(DBModel dbModel) {
    DatabaseHelper.instance.insert(dbModel);
    print("Adding new Entry is Successful...");
  }

  deletEntry() async {
    int rowsaffected = await DatabaseHelper.instance.delete(1); //need of id
    print(rowsaffected);
    print("Dletion is successfull");
  }

  getEntry() async {
    List<Map<String, dynamic>> querryRows =
        await DatabaseHelper.instance.queryAll();
    print("Yupp we got the query of all $querryRows");

    daily.addAll(querryRows);

    print("Printing the list ~~~~:: $daily");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child:
            Scaffold(backgroundColor: grey.withOpacity(0.34), body: getBody()));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration:
                  BoxDecoration(color: appbar.withOpacity(0.7), boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 20, left: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Create Budget",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.yellow),
                    ),
                    Icon(
                      Ionicons.md_search,
                      size: 27,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Choose Category",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.7)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: activeCategory == index
                                  ? primary
                                  : Colors.transparent,
                              width: 4),
                          borderRadius: BorderRadius.circular(12),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.4),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(categories[index]['icon'],
                                  fit: BoxFit.cover, width: 40, height: 40),
                            ),
                            Text(categories[index]['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text("Budget Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _budgetName,
                  cursorColor: black,
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Enter The Budget Name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Budget Amount",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width - 140,
                      child: TextField(
                        controller: _budgetAmount,
                        cursorColor: black,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                        decoration: InputDecoration(
                          focusColor: white,
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: "Enter The Budget Amount",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {


                          // deletEntry();

                          DBModel newEntry = DBModel(
                              name: 'Aam',
                              date: DateTime.now(),
                              icon: "assets/images/charity.png",
                              price:
                                  67.09); //change entry to db as double from text

                          addNewEntry(newEntry);

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const RootApp()));

                          // MonthAndYear().getMonthsAndYear();
                          
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: white,
                          size: 45,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
