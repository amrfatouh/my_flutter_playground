import 'package:flutter/material.dart';
import 'package:my_playground/screens/grid_view_screen.dart';
import 'package:my_playground/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white.withOpacity(0),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
