import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/cenarios/cen6/cen6.controller.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.screen.dart';
import 'package:maosunidas/src/utils/notifications.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class InteressesScreen extends StatefulWidget {
  const InteressesScreen({Key key}) : super(key: key);

  @override
  _InteressesScreenState createState() => _InteressesScreenState();
}

class _InteressesScreenState extends State<InteressesScreen> {
  final List<String> interesses = <String>[
    'Educação Infantil',
    'Crianças',
    'Fome'
  ];

  Widget tile(String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.delete),
    );
  }

  final String notifTitle =
      'Ativar notificações para ações próximas a sua localização';

  final String notifDesc =
      'Você será notificado sobre ações que estão acontescendo próximas a suas redondezas';

  final String notifBody =
      'Uma nova ação em "Educação Infantil" foi cadastrada perto da sua localização.';

  @override
  void dispose() {
    if (subscription != null) {
      subscription.cancel();
    }
    super.dispose();
  }

  StreamSubscription<String> subscription;

  @override
  void initState() {
    subscription =
        selectNotificationSubject.stream.listen((String payload) async {
      if (payload != null && payload == NotifPayloads.openAcao) {
        await Navigator.push(
            context, MaterialPageRoute(builder: (_) => AcaoScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // AppWidgets.div(),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: AppWidgets.title('Interesses', context),
            ),
            Card(
              child: Observer(
                builder: (BuildContext bcontext) => AppWidgets.switcher(
                    bcontext,
                    title: notifTitle,
                    subtitle: notifDesc,
                    value: GetIt.I.get<Cen6Controller>().isNotifOn,
                    onChanged: (bool _) {
                  if (_) {
                    Future.delayed(Duration(seconds: 2)).then((_) =>
                        showNotification(
                            body: notifBody, payload: NotifPayloads.openAcao));
                  }
                  GetIt.I.get<Cen6Controller>().isNotifOn = _;
                }),
              ),
            ),
            // AppWidgets.div(0.5),
            ...List<Widget>.generate(
                2 * interesses.length - 1,
                (int i) =>
                    i % 2 == 0 ? tile(interesses[i ~/ 2]) : AppWidgets.div(0.5))
          ],
        ),
      ),
    );
  }
}
