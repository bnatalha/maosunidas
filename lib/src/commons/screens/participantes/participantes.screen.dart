import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/commons/screens/participantes/participantes_detail.screen.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class ParticipantesScreen extends StatefulWidget {
  const ParticipantesScreen({Key key}) : super(key: key);

  @override
  _ParticipantesScreenState createState() => _ParticipantesScreenState();
}

class _ParticipantesScreenState extends State<ParticipantesScreen> {
  AcaoController get controller => GetIt.I.get<AcaoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
              // color: Colors.grey.shade300,
            ),
            child: ListTile(
              dense: true,
              leading: Icon(Icons.group, size: 40, color: Colors.black),
              title: AppWidgets.title('Participantes', context),
              trailing: Text(
                '${controller.acao.participantes.length}/${controller.acao.maxParticipants}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, i) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ParticipantesDetailScreen(
                            voluntario: controller.acao.participantes[i],
                          )));
                },
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(Icons.person, size: 30, color: Colors.white),
                ),
                title: Text(controller.acao.participantes[i].name),
                trailing: Text(controller.acao.participantes[i].profession),
              ),
              separatorBuilder: (_, i) => AppWidgets.div(),
              itemCount: controller.acao.participantes.length,
            ),
          ),
        ],
      ),
    );
  }
}
