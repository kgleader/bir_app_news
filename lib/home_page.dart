// ignore_for_file: non_constant_identifier_names

import 'package:bir_app/pageOne.dart';
import 'package:bir_app/pageTwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'end_drawer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(String s, {super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _pageIndex = 0;
  final _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: const PageOne(),
    ),
    MyRoute(
      iconData: Icons.calendar_today,
      page: const PageTwo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Жанылыктар'),
        backgroundColor: const Color(0xff4367b1),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // actions: <Widget>[
        //   Builder(
        //     builder: (context) {
        //       return IconButton(
        //         icon: const Icon(Icons.person),
        //         onPressed: () {
        //           Scaffold.of(context).openEndDrawer();
        //         },
        //       );
        //     },
        //   ),
        // ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      drawer: const Drawer(),
      endDrawer: const EndDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: pages
            .map(
              (p) => Icon(
                p.iconData,
                size: 30,
                color: Colors.white,
              ),
            )
            .toList(),
        color: const Color(0xff4367b1),
        buttonBackgroundColor: const Color(0xff4367b1),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      body: pages[_pageIndex].page,
    );
  }

  CurvedNavigationBar(
      {required GlobalKey<State<StatefulWidget>> key,
      required int index,
      required double height,
      required List<Icon> items,
      required Color color,
      required Color buttonBackgroundColor,
      required Color backgroundColor,
      required Cubic animationCurve,
      required Duration animationDuration,
      required Null Function(dynamic index) onTap}) {}
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}
