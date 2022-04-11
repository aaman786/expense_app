import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_budget/Pages/profile_entry_page.dart';
import 'package:my_budget/json/profile_json.dart';
import 'package:my_budget/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _email = TextEditingController(text: email);
  final TextEditingController _bod = TextEditingController(text: bod);
  final TextEditingController _income =
      TextEditingController(text: monthlyIncome);

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
        children: [
          Container(
            width: size.width,
            decoration:
                BoxDecoration(color: appbar.withOpacity(0.6), boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 3),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.yellow),
                        ),
                        Icon(
                          Ionicons.md_settings,
                          size: 29,
                          color: Colors.yellow,
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: (size.width - 40) * 0.4,
                        child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: -2,
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: primary.withOpacity(0.7),
                                radius: 110.0,
                                lineWidth: 6.0,
                                percent: 0.53,
                                progressColor: Colors.black,
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 13,
                              child: Container(
                                width: 85,
                                height: 85,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // image: DecorationImage(
                                  //     image: NetworkImage(profileUrl),
                                  //     fit: BoxFit.cover),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              name,
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Credit score: " + credit,
                              style: TextStyle(
                                  color: white.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "United Bank of India",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Rs. 12000",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.greenAccent, width: 2),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _email,
                  cursorColor: black,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _bod,
                  cursorColor: black,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                  decoration: InputDecoration(
                    labelText: "Birth of Date",
                    labelStyle: const TextStyle(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _income,
                  cursorColor: black,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                  decoration: InputDecoration(
                    labelText: "Total Income",
                    labelStyle: const TextStyle(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            child: const Text(
              'Edit Details',
              style: TextStyle(fontSize: 18),
            ),
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.blue.withOpacity(0.8),
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileEntryPage()));
            },
          )
        ],
      ),
    );
  }
}
