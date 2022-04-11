import 'package:flutter/material.dart';
import 'package:my_budget/provider/month_yr.dart';
import 'package:my_budget/theme/colors.dart';
import 'package:provider/provider.dart';

class MonthLayout extends StatelessWidget {
  const MonthLayout({Key? key}) : super(key: key);

//   @override
//   _MonthLayoutState createState() => _MonthLayoutState();
// }

// class _MonthLayoutState extends State<MonthLayout> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<dynamic> monthAndYear =
        context.watch<MonthAndYear>().listMonthandYearMap;

    return Consumer<MonthIndex>(
      builder: (context, monthIndex, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          monthAndYear.length,
          (index) {
            return GestureDetector(
              onTap: () {
                // setState(() {
                //   activeMonth = index;
                // });
                monthIndex.activeMonth = index;
              },
              child: SizedBox(
                width: (size.width - 40) / 7,
                child: Column(
                  children: [
                    Text(
                      monthAndYear[index]['month'],
                      style: const TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: monthIndex.activeMonth == index
                              ? primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: monthIndex.activeMonth == index
                                  ? primary
                                  : white.withOpacity(0.6),
                              width: 3)),
                      child: Center(
                        child: Text(monthAndYear[index]['year'],
                            style: TextStyle(
                                fontSize: 18.5,
                                color: monthIndex.activeMonth == index
                                    ? white
                                    : black,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
