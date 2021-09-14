import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/home/home.screen.dart';
import 'package:maosunidas/src/utils/notifications.dart';

class MaosUnidasApp extends StatefulWidget {
  @override
  _MaosUnidasAppState createState() => _MaosUnidasAppState();
}

class _MaosUnidasAppState extends State<MaosUnidasApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (selectNotificationSubject != null) {
      selectNotificationSubject.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
