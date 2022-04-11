// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:my_budget/_root_app.dart';
// import 'package:my_budget/json/daily_json.dart';
// import "../../theme/colors.dart";

// class TextfieldButton extends StatefulWidget {
//   const TextfieldButton({Key? key}) : super(key: key);

//   @override
//   _TextfieldButtonState createState() => _TextfieldButtonState();
// }

// class _TextfieldButtonState extends State<TextfieldButton> {
//   final nameController = TextEditingController();
//   final amountController = TextEditingController();

//   void _addNewEntry(String name, double amount, String icon) {
//     final newEntry = {
//       "name": name,
//       "date": DateTime.now(),
//       "icon": icon,
//       "price": amount,
//     };

//     setState(() {
//       daily.add(newEntry);
//     });

//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const RootApp()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         TextField(
//           controller: nameController,
//           cursorColor: black,
//           style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepPurple),
//           decoration: InputDecoration(
//             // border: InputBorder.none,
//             enabledBorder: OutlineInputBorder(
//               borderSide:
//                   const BorderSide(color: Colors.blueAccent, width: 2.0),
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             hintText: "Enter The Budget Name",
//             labelText: "Budget Name",
//             labelStyle: const TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: size.width - 140,
//               child: TextField(
//                 controller: amountController,
//                 cursorColor: black,
//                 style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple),
//                 decoration: InputDecoration(
//                   focusColor: white,
//                   // border: InputBorder.none,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide:
//                         const BorderSide(color: Colors.blueAccent, width: 2.0),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   hintText: "Enter The Budget Amount",
//                   labelText: "Budget Amount",
//                   labelStyle: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             GestureDetector(
//               // _addNewEntry(
//               //     nameController.text,
//               //     double.parse(amountController.text),
//               //     "assets/images/charity.png");

//               // print(daily);
              
//               onTap: () {
//                 DateTime d = DateTime.now();
//                 print(DateFormat("EEE").format(d));
//               },
//               child: Container(
//                 width: 80,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     color: primary, borderRadius: BorderRadius.circular(15)),
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: white,
//                   size: 45,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
