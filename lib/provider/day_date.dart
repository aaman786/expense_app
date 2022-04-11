import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:my_budget/json/day_month.dart';

class DateAndDayProvider extends ChangeNotifier {
  final List<String> _weekDays = [];
  List<String> get weekDays => _weekDays;

  final List<String> _dateOfWeek = [];
  List<String> get dateOfWeek => _dateOfWeek;

  final List<Map<String, String>> _dayAndDate = [];
  List<Map<String, String>> get dayAndDate => _dayAndDate;

  // set setter(double? total) {
  //   _totalForDailyPage = total;
  // }

  void dateAndDayIntoMap() {
    getDateProvider();
    getDaysProvider();

    Map<String, String> a = {};

    for (int i = 0; i < 7; i++) {
      a = {
        "day": _weekDays[i],
        "date": _dateOfWeek[i],
      };
      _dayAndDate.add(a);
    }
    // print("List of `````$_dayAndDate");
  }

  getDateProvider() {
    DateTime dateTime = DateTime.now();

    List<String> firstThreeDaysDateList = [];
    List<String> remainingDaysOfWeekList = [];

    void firstThreeDaysDate() {
      DateTime dt;
      String date;
      for (int i = 1; i >= 0; i--) {
        dt = dateTime.subtract(Duration(days: dateTime.weekday + i));
        date = DateFormat('d').format(dt);
        firstThreeDaysDateList.add(date);
      }
    }

    void remainingDaysOfWeek() {
      String date;
      DateTime dt;
      for (int i = 5; i > 0; i--) {
        dt = dateTime.subtract(Duration(days: dateTime.weekday - i));
        date = DateFormat('d').format(dt);
        remainingDaysOfWeekList.add(date);
      }
    }

    firstThreeDaysDate();
    remainingDaysOfWeek();

    void weekDate() {
      _dateOfWeek.addAll(firstThreeDaysDateList);
      _dateOfWeek.addAll(remainingDaysOfWeekList.reversed);
      print(" final week $_dateOfWeek");
    }

    weekDate();
  }

  getDaysProvider() {
    DateTime d = DateTime.now();
    String day = DateFormat('EEE').format(d);
    List<int> weekDayIndexes = [];
    late int dayFound;

    for (int i = 0; i < days.length; i++) {
      if (day.toLowerCase() == days[i]['label'].toString().toLowerCase()) {
        dayFound = i;

        for (int indexesFromStart = dayFound;
            indexesFromStart >= 0;
            indexesFromStart--) {
          weekDayIndexes.add(indexesFromStart);
        }

        for (int indexesFromLast = 6;
            indexesFromLast > dayFound;
            indexesFromLast--) {
          weekDayIndexes.add(indexesFromLast);
        }
      }
    }

    List<String> tempWeekDaysForReversing = [];
    for (var i = 0; i < weekDayIndexes.length; i++) {
      tempWeekDaysForReversing.add(days[weekDayIndexes[i]]['label'].toString());
    }
    _weekDays.addAll(tempWeekDaysForReversing.reversed);
  }
}

// for hadling Date layout of daliy fl
class DateIndex extends ChangeNotifier {
  int _activeDay = 4;
  int get activeDay => _activeDay;

  set activeDay(int index) {
    _activeDay = index;
    notifyListeners();
  }
}
