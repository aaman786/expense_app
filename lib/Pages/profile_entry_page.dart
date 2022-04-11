import 'package:flutter/material.dart';
import 'package:my_budget/Pages/profile_page.dart';
import 'package:my_budget/json/profile_json.dart';
import 'package:my_budget/theme/colors.dart';

class ProfileEntryPage extends StatefulWidget {
  const ProfileEntryPage({Key? key}) : super(key: key);

  @override
  ProfileEntryPageState createState() => ProfileEntryPageState();
}

class ProfileEntryPageState extends State<ProfileEntryPage> {
  final TextEditingController _email = TextEditingController(text: email);
  final TextEditingController _bod = TextEditingController(text: bod);
  final TextEditingController _income =
      TextEditingController(text: monthlyIncome);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white.withOpacity(0.8),
      body: getBody(),
      appBar: AppBar(
        title: const Text("Enter your Details"),
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                  color: black, fontSize: 22, fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
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
                  color: black, fontSize: 22, fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
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
                  color: black, fontSize: 22, fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: null,
            cursorColor: black,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: const TextStyle(
                  color: black, fontSize: 22, fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blue.withOpacity(0.8),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
