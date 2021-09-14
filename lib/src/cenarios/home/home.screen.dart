import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/cenarios/cen1/cen1.gate.dart';
import 'package:maosunidas/src/cenarios/cen3/cen3.gate.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.controller.dart';
import 'package:maosunidas/src/cenarios/cen4/cen4.gate.dart';
import 'package:maosunidas/src/cenarios/cen5/cen5.gate.dart';
import 'package:maosunidas/src/cenarios/cen6/cen6.gate.dart';
import 'package:maosunidas/src/cenarios/cen6/cen6.controller.dart';
import 'package:maosunidas/src/commons/mocks.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/utils/notifications.dart';
import 'package:mobx/mobx.dart';

import 'home.strings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildButton({String title, String description, Function onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: Text(description),
      contentPadding: const EdgeInsets.all(14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Cenários'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Selecione o cenário',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            buildButton(
              title: HomeStrings.CEN_1_TITLE,
              description: HomeStrings.CEN_1_DESC,
              onTap: () async {
                await setupNotifs();
                // GetIt.I.get<AcaoController>().acao =
                //     MockAcoes.mockAcoes.first.copyWith();
                // GetIt.I.get<TimelineController>().posts =
                //     ObservableList.of(MockTimelinePost.all.map((e) => e));

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cen1Gate()));
              },
            ),
            buildButton(
              title: HomeStrings.CEN_3_TITLE,
              description: HomeStrings.CEN_3_DESC,
              onTap: () async {
                await setupNotifs();
                // GetIt.I.get<AcaoController>().acao =
                //     MockAcoes.mockAcoes.first.copyWith();
                GetIt.I.get<TimelineController>().posts =
                    ObservableList.of(MockTimelinePost.all.map((e) => e));

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cen3Gate()));
              },
            ),
            buildButton(
              title: HomeStrings.CEN_4_TITLE,
              description: HomeStrings.CEN_4_DESC,
              onTap: () async {
                await setupNotifs();
                GetIt.I.get<AcaoController>().acao =
                    MockAcoes.all.first.copyWith();
                GetIt.I.get<AcaoController>().isUserFromTheOng = true;

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cen4Gate()));
              },
            ),
            buildButton(
              title: HomeStrings.CEN_5_TITLE,
              description: HomeStrings.CEN_5_DESC,
              onTap: () async {
                await setupNotifs();
                GetIt.I.get<AcaoController>().acao =
                    MockAcoes.all.first.copyWith();
                GetIt.I.get<AcaoController>().isUserFromTheOng = true;

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cen5Gate()));
              },
            ),
            buildButton(
              title: HomeStrings.CEN_6_TITLE,
              description: HomeStrings.CEN_6_DESC,
              onTap: () async {
                await setupNotifs();
                GetIt.I.get<AcaoController>().acao =
                    MockAcoes.all.first.copyWith();
                GetIt.I.get<Cen6Controller>().isNotifOn = false;

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cen6Gate()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
