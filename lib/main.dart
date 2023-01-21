import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavBar('Жанылыктар'),
    theme: ThemeData.light().copyWith(
      canvasColor: Colors.grey,
    ),
  ));
}
