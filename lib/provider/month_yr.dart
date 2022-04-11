import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MonthAndYear extends ChangeNotifier {
  final List<Map<String, String>> _listMonthAndYearMap = [];
  List<Map<String, String>> get listMonthandYearMap => _listMonthAndYearMap;

  void getMonthsAndYear() {
    late List<String> _listMonthAndYear = [];

    DateTime userCreatedDate = DateTime(2020, 10, 1, 0, 0, 0, 0, 0);
    final List<String> _listMonthAndYearOfFutureAlso = [];
    DateFormat dateFormat = DateFormat("MMM yyyy");
    final dates = <String>[];
    final now = DateTime.now();
    final sixMonthFromNow = DateTime(now.year, now.month + 6);
    DateTime date = userCreatedDate;

    while (date.isBefore(sixMonthFromNow)) {
      dates.add(dateFormat.format(date));
      date = DateTime(date.year, date.month + 1);
    }

    _listMonthAndYearOfFutureAlso.addAll(dates);
    _listMonthAndYear =
        _listMonthAndYearOfFutureAlso.sublist(11, 17); // list containg

    monthAndYearIntoMap(_listMonthAndYear); // print(f);
  }

  void monthAndYearIntoMap(List<String> listMonthAndYear) {
    List listSlicedMonthYear;
    Map<String, String> _monthAndYearMap = {};

    for (var i = 0; i < listMonthAndYear.length; i++) {
      listSlicedMonthYear = listMonthAndYear[i].toString().split(" ");
      _monthAndYearMap = {
        "month": listSlicedMonthYear[0],
        "year": listSlicedMonthYear[1],
      };
      _listMonthAndYearMap.add(_monthAndYearMap);
    }
    // print("The list is `````$_listMonthAndYearMap");
  }
}

class MonthIndex extends ChangeNotifier {
  int _activeMonth = 4;

  int get activeMonth => _activeMonth;

  set activeMonth(int index) {
    _activeMonth = index;
    notifyListeners();
  }
}
