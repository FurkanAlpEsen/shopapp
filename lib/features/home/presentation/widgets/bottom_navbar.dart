import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 100;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.sports_soccer_outlined,
      "Anasayfa",
      Colors.pink,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.scoreboard_outlined,
      "Tab#2",
      Colors.pink,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.tab,
      "Tab#3",
      Colors.pink,
      circleStrokeColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.shopping_basket_outlined,
      "Sepetim",
      Colors.pink,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.gamepad_outlined,
      "Tab#5",
      Colors.pink,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    // selectedPos = BlocProvider.of<HomeBloc>(context).state.posIndex;
    _navigationController = CircularBottomNavigationController(
        BlocProvider.of<HomeBloc>(context).state.posIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          child: CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            selectedPos: state.posIndex,
            barHeight: bottomNavBarHeight,
            barBackgroundColor: Color.fromARGB(255, 42, 55, 59),
            circleStrokeWidth: 0,
            animationDuration: Duration(milliseconds: 300),
            selectedCallback: (int? selectedPos) {
              context.read<HomeBloc>()..add(HomeEvent(selectedPos!));
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
