import 'package:flutter/material.dart';

class MenuSlider extends StatelessWidget {
  final bool isMenuOpen;

  const MenuSlider({Key? key, required this.isMenuOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: 0,
      left: isMenuOpen ? 0 : -250,
      height: MediaQuery.of(context).size.height,
      child: Container(
        width: 250,
        color: Colors.blue[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menu Items
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Star Tasks'),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Category'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Theme'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}