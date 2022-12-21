import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Icon(
          Icons.person,
          color: Colors.indigo,
        ),
        width: 30,
        height: 30,
      ),
    );
  }
}
