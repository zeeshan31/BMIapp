import 'package:flutter/material.dart';

class IconData2 extends StatelessWidget {
  IconData2({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 60.0,
      ),
      Padding(
        padding: const EdgeInsets.all(11.0),
        child: Text(
          label,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    ]);
  }
}
