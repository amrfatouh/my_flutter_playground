import 'package:flutter/material.dart';
import 'package:my_playground/screens/grid_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Playground')),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.grid_view),
              title: Text('GridView'),
              subtitle: Text('play with .extent() and .count() constructors'),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewScreen()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
