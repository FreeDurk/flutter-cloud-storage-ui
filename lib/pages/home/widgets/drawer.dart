import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/profile.png'),
          ),
        ],
      ),
    );
  }
}
