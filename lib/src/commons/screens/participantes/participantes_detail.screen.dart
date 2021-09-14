import 'package:flutter/material.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class ParticipantesDetailScreen extends StatefulWidget {
  const ParticipantesDetailScreen({Key key, @required this.voluntario})
      : super(key: key);

  final Voluntario voluntario;

  @override
  _ParticipantesDetailScreenState createState() =>
      _ParticipantesDetailScreenState();
}

class _ParticipantesDetailScreenState extends State<ParticipantesDetailScreen> {
  Voluntario get voluntario => widget.voluntario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(
          child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(Icons.person, size: 70, color: Colors.white),
                ),
              ),
              Expanded(child: AppWidgets.title(voluntario.name, context)),
            ],
          ),
          ListTile(
            title: Text('Telefone:', style: TextStyle(fontSize: 20)),
            subtitle: Text(voluntario.phone),
          ),
          ListTile(
            title: Text('Email:', style: TextStyle(fontSize: 20)),
            subtitle: Text(voluntario.email),
          ),
          ListTile(
            title: Text('Profissão:', style: TextStyle(fontSize: 20)),
            subtitle: Text(voluntario.profession),
          ),
          ListTile(
            title: Text('Endereço:', style: TextStyle(fontSize: 20)),
            subtitle: Text(voluntario.address),
          ),
        ],
      )),
    );
  }
}
