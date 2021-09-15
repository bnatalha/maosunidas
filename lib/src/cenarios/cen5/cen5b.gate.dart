import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen1/search.screen.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.screen.dart';
import 'package:maosunidas/src/utils/notifications.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';

class Cen5bGate extends StatefulWidget {
  const Cen5bGate({Key key}) : super(key: key);

  @override
  _Cen5bGateState createState() => _Cen5bGateState();
}

class _Cen5bGateState extends State<Cen5bGate> {
  final String notifBody =
      'A Ação "Ação do Amanhecer" no qual você está cadastrado(a) foi alterada. Abra o aplicativa para ver qual foi a alteração.';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) =>
        showNotification(body: notifBody, payload: NotifPayloads.openAcao));
    return SearchScreen();
  }
}
