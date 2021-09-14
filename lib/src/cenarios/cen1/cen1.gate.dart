import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen1/search.screen.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.screen.dart';

class Cen1Gate extends StatefulWidget {
  const Cen1Gate({Key key}) : super(key: key);

  @override
  _Cen1GateState createState() => _Cen1GateState();
}

class _Cen1GateState extends State<Cen1Gate> {
  @override
  Widget build(BuildContext context) {
    return SearchScreen();
  }
}
