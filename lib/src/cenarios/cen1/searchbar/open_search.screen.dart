import 'package:flutter/material.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';

class OpenSearchScreen extends StatefulWidget {
  const OpenSearchScreen({Key key}) : super(key: key);

  @override
  _OpenSearchScreenState createState() => _OpenSearchScreenState();
}

class _OpenSearchScreenState extends State<OpenSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(),
    );
  }
}
