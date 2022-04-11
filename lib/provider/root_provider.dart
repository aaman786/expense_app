import 'package:flutter/cupertino.dart';
import 'package:my_budget/Pages/Overview%20page/overview_dart.dart';
import 'package:my_budget/Pages/create%20budget/create_budget_page.dart';
import 'package:my_budget/Pages/daily%20page/daily_page.dart';
import 'package:my_budget/Pages/profile_page.dart';
import 'package:my_budget/Pages/stat%20page/stat_page.dart';

class PageIndexProvider extends ChangeNotifier {
  int _pageIndexProvider = 0;
  int get pageIndexProvider => _pageIndexProvider;

  final List<Widget> _screen = const [
    DailyPage(),
    StatsPage(),
    Overview(),
    ProfilePage(),
    CreateBudgetPage(),
  ];
  Widget get currentScreen => _screen[_pageIndexProvider];

  set pageIndexProvider(int index) {
    _pageIndexProvider = index;
    notifyListeners();
  }
}
