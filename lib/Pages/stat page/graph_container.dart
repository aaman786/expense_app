import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_budget/Widgets/chart.dart';
import 'package:my_budget/theme/colors.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({Key? key}) : super(key: key);

//   @override
//   GraphContainerState createState() => GraphContainerState();
// }

// class GraphContainerState extends State<GraphContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.01), spreadRadius: 10, blurRadius: 3)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Net Balance",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5,
                        color: black.withOpacity(0.9)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rs 244.5 ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.5,
                        color: Colors.indigo.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4,
              right: 0,
              child: Container(
                color: grey.withOpacity(0.3),
                width: size.width - 35,
                height: 160,
                child: LineChart(mainData()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
