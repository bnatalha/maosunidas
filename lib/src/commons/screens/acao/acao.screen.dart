import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/commons/screens/acao_edit/acao_edit.screen.dart';
import 'package:maosunidas/src/commons/screens/participantes/participantes.screen.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';
import 'package:intl/intl.dart';

class AcaoScreen extends StatefulWidget {
  const AcaoScreen({
    Key key,
  }) : super(key: key);

  @override
  _AcaoScreenState createState() => _AcaoScreenState();
}

class _AcaoScreenState extends State<AcaoScreen> {
  AcaoController get controller => GetIt.I.get<AcaoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: controller.isUserFromTheOng
          ? Container(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AcaoEditScreen())),
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.edit,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            )
          : null,
      appBar: DefaultAppBar(),
      body: Container(
        child: Observer(
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.postHeader(controller.acao.registeredBy.name),
              // Divider(color: Colors.black, thickness: 1.5),
              Container(
                  child: AppWidgets.title(controller.acao.title, context)),
              statusBox,
              const SizedBox(height: 10),
              // descrição
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppWidgets.title('Descrição', context)),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: Text(controller.acao.description),
              ),
              // causas
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: Chip(label: Text(controller.acao.causas.first)),
              ),
              // participantes
              Container(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: Row(
                  children: [
                    participantsButton(),
                    Spacer(),
                    if (!controller.isUserFromTheOng &&
                        (controller.acao.maxParticipants >
                                controller.acao.participantes.length ||
                            controller.acao.userIsRegistered))
                      joinButton(),
                  ],
                ),
              ),
              // data
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppWidgets.title('Data', context)),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.fromLTRB(10, 0, 4, 8),
                child: Text(
                  'Entre os dias ${DateFormat('dd/MM/yy').format(controller.acao.start).toString()} e ${DateFormat('dd/MM/yy').format(controller.acao.end).toString()}',
                ),
              ),
              // local
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppWidgets.title('Local', context)),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.fromLTRB(10, 0, 4, 8),
                child: Text(
                  controller.acao.address,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get statusBox => controller.acao.status == AcaoStatus.agendada
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

  Widget participantsButton() {
    return TextButton(
      onPressed: controller.isUserFromTheOng
          ? () {
              print('clicou');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ParticipantesScreen()));
            }
          : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Row(children: [
        Icon(Icons.group, size: 50),
        SizedBox(width: 10),
        Text(
            '${controller.acao.participantes.length}/${controller.acao.maxParticipants}\nparticipantes'),
      ]),
    );
  }

  Widget joinButton() {
    return controller.acao.userIsRegistered
        ? ElevatedButton(
            onPressed: () async {
              bool makeChange = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Deixar de participar? ):'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('CANCELAR'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('OK'),
                    )
                  ],
                ),
              );
              if (makeChange) {
                setState(() {
                  controller.acao.userIsRegistered = false;
                  controller.acao.participantes.removeLast();
                });
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Column(children: [
              Icon(
                Icons.person_remove,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("parar de participar"),
              ),
            ]))
        : ElevatedButton(
            onPressed: () async {
              // bool makeChange = await showDialog<bool>(
              //   context: context,
              //   builder: (_) => AlertDialog(
              //     title: Text('Você tem certeza que quer participar?'),
              //     actions: [
              //       TextButton(
              //         onPressed: () {
              //           Navigator.of(context).pop(false);
              //         },
              //         child: Text('CANCELAR'),
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           Navigator.of(context).pop(true);
              //         },
              //         child: Text('OK'),
              //       )
              //     ],
              //   ),
              // );
              // if (makeChange) {
              setState(() {
                controller.acao.userIsRegistered = true;
                controller.acao.participantes
                    .add(Voluntario('', '', '', '', ''));
              });
              // }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Column(children: [
              Icon(
                Icons.person_add,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("participar"),
              ),
            ]));
  }
}
