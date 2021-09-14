import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key key}) : super(key: key);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade700,
      leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      title: Text(
        "Mãos Unidas 🤝",
      ),
    );
  }
}
