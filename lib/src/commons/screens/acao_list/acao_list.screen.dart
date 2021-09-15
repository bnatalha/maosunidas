import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:maosunidas/src/commons/mocks.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.screen.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

import '../../models.dart';

class AcaoListScreen extends StatefulWidget {
  const AcaoListScreen({
    Key key,
    this.causa = '',
  }) : super(key: key);

  final String causa;

  @override
  _AcaoListScreenState createState() => _AcaoListScreenState();
}

class _AcaoListScreenState extends State<AcaoListScreen> {
  AcaoController get controller => GetIt.I.get<AcaoController>();

  @override
  Widget build(BuildContext context) {
    List<Acao> acoes = MockAcoes.all
        .where((acao) => acao.causas.contains(widget.causa))
        .toList();
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.title('Resultados para \"${widget.causa}\":', context),
          AppWidgets.div(1.3),
          Expanded(
            child: acoes.isEmpty
                ? Center(
                    child: Text('Nenhum resultado encontrado'),
                  )
                : ListView.builder(
                    itemBuilder: (_, i) => Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1))),
                          child: ListTile(
                            onTap: () {
                              controller.acao = acoes[i];
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => AcaoScreen()));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(acoes[i].title),
                                statusBox(acoes[i])
                              ],
                            ),
                            subtitle: Container(
                              // padding: EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    acoes[i].userIsRegistered
                                        ? 'Participando'
                                        : '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.green),
                                  ),
                                  Text(acoes[i].address),
                                  Text(
                                    'Entre os dias ${DateFormat('dd/MM/yy').format(controller.acao.start).toString()} e ${DateFormat('dd/MM/yy').format(controller.acao.end).toString()}',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    // separatorBuilder: (_, i) => AppWidgets.div(),
                    itemCount: acoes.length),
          ),
        ],
      ),
    );
  }

  Widget statusBox(Acao acao) => acao.status == AcaoStatus.agendada
      ? TextButton(
          onPressed: null,
          child: Text('Agendada'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        )
      : TextButton(
          onPressed: null,
          child: Text('Em Andamento'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        );
}
