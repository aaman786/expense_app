import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_budget/Pages/Overview%20page/overview_dart.dart';
import 'package:my_budget/Pages/create%20budget/create_budget_page.dart';
import 'package:my_budget/Pages/daily%20page/daily_page.dart';
import 'package:my_budget/Pages/profile_page.dart';
import 'package:my_budget/Pages/stat%20page/stat_page.dart';
import 'package:my_budget/provider/root_provider.dart';
import 'package:provider/provider.dart';
import 'theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexProvider>(
      builder: (context, value, child) => Scaffold(
        // body: getBody(value),
        body: value.currentScreen,
        bottomNavigationBar: getFotter(value),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.pageIndexProvider = 4;
          },
          child: const Icon(Icons.add, size: 34),
          backgroundColor: primary,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget getBody(PageIndexProvider val) {
    return IndexedStack(
      index: val.pageIndexProvider,
      children: const [
        DailyPage(),
        StatsPage(),
        Overview(),
        ProfilePage(),
        CreateBudgetPage(),
      ],
    );
  }

  Widget getFotter(PageIndexProvider val) {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.md_person,
    ];

    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeIndex: val.pageIndexProvider,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: Colors.blueAccent,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        iconSize: 32,
        onTap: (index) {
          val.pageIndexProvider = index;
        });
  }
}
