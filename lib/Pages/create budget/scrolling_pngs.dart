import 'package:flutter/material.dart';
import '../../json/create_budget_json.dart';
import '../../theme/colors.dart';

class ScrollingPngs extends StatefulWidget {
  const ScrollingPngs({ Key? key }) : super(key: key);

  @override
  _ScrollingPngsState createState() => _ScrollingPngsState();
}

class _ScrollingPngsState extends State<ScrollingPngs> {
  int activeCategory = 0;

  @override
  Widget build(BuildContext context) {
    return  Row(
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
            );
  }
}