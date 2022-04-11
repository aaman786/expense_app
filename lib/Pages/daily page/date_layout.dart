import 'package:flutter/material.dart';
import 'package:my_budget/provider/day_date.dart';
import 'package:provider/provider.dart';
import '../../theme/colors.dart';


class DateLayout extends StatefulWidget {
  const DateLayout({Key? key}) : super(key: key);

  @override
  _DateLayoutState createState() => _DateLayoutState();
}

class _DateLayoutState extends State<DateLayout> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> weekDayAndDate =
        context.watch<DateAndDayProvider>().dayAndDate;

    var size = MediaQuery.of(context).size;
    return Consumer<DateIndex>(
      builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(weekDayAndDate.length, (index) {
            return GestureDetector(
              onTap: () {
                // setState(() {
                //   activeDay = index;
                // });
                value.activeDay = index;
                // print("$activeDay and $index");
              },
              child: SizedBox(
                width: (size.width - 40) / 7,
                child: Column(
                  children: [
                    Text(
                      weekDayAndDate[index]['day']!,
                      style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 33,
                      height: 33,
                      decoration: BoxDecoration(
                          color: value.activeDay == index
                              ? primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2,
                              color: value.activeDay == index
                                  ? white
                                  : Colors.yellow)),
                      child: Center(
                        child: Text(weekDayAndDate[index]['date']!,
                            style: TextStyle(
                                fontSize: 15.5,
                                color: value.activeDay == index ? white : black,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
