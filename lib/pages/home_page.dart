import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      drawer: Drawer(
        child: Center(
          child: Container(
            child: Text("Hello this is drawer"),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome Shakil's World for $days"),
        ),
      ),
    );
  }
}
