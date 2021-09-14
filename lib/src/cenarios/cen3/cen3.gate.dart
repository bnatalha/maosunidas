import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.screen.dart';

class Cen3Gate extends StatefulWidget {
  const Cen3Gate({Key key}) : super(key: key);

  @override
  _Cen3GateState createState() => _Cen3GateState();
}

class _Cen3GateState extends State<Cen3Gate> {
  @override
  Widget build(BuildContext context) {
    return TimelineScreen();
  }
}
