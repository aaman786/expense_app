

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_budget/local%20db/database_helper.dart';
import 'package:my_budget/json/daily_json.dart';
import 'package:my_budget/local%20db/model/db_model.dart';

class DailyPageProvider extends ChangeNotifier {
  double? _totalForDailyPage;

  double? get totalForDailyPage => _totalForDailyPage;

  // set setter(double? total) {
  //   _totalForDailyPage = total;
  // }

  void getTotal() {
    print("inside gettotal");
    double total = 0;

    // for (var i = 0; i < daily.length; i++) {
    //   total = total + daily[i][i];
    // }

    print(total);
    // _totalForDailyPage = total;
    _totalForDailyPage = 4.09;

    print("the value in provider " + _totalForDailyPage.toString());
  }

  List _items = [];
  List get items {
    return [..._items];
  }

  Future<void> getEntriesNew() async {
    final getData = await DatabaseHelper.instance.queryAll();
    
    // _items = getData
    //     .map((item) => jsonEncode(DBModel(
    //         id: item["_id"],
    //         name: item["_name"],
    //         price: item["price"],
    //         date: item["date"],
    //         icon: item["icon"] ).toMap()))
    //     .toList();
    

    print(" list item $items");
    daily.addAll(_items);
    print(daily);
    notifyListeners();
  }

  void getEntryProvider() async {
    List<Map<String, dynamic>> querryRows =
        await DatabaseHelper.instance.queryAll();
    print("Yupp we got the query of all $querryRows");

    daily.addAll(querryRows);

    print("Printing the list ~~~~:: $daily");
    notifyListeners();
  }
}
