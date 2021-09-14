import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class AcaoEditScreen extends StatefulWidget {
  const AcaoEditScreen({Key key}) : super(key: key);

  @override
  _AcaoEditScreenState createState() => _AcaoEditScreenState();
}

class _AcaoEditScreenState extends State<AcaoEditScreen> {
  AcaoController get controller => GetIt.I.get<AcaoController>();

  final String notifTitle =
      'Notificar participantes de mudanças de status ou alterações na ação';

  bool switchValue = false;

  TextEditingController tituloCtrl;
  TextEditingController maxPartCtrl;
  TextEditingController descCtrl;
  TextEditingController dataIniCtrl;
  TextEditingController dataFimCtrl;
  TextEditingController endCtrl;

  @override
  void initState() {
    tituloCtrl = TextEditingController();
    maxPartCtrl = TextEditingController();
    descCtrl = TextEditingController();
    dataIniCtrl = TextEditingController();
    dataFimCtrl = TextEditingController();
    endCtrl = TextEditingController();

    loadFieldValues();

    super.initState();
  }

  void loadFieldValues() {
    tituloCtrl.value = TextEditingValue(text: controller.acao.title);
    maxPartCtrl.value =
        TextEditingValue(text: controller.acao.maxParticipants.toString());
    descCtrl.value = TextEditingValue(text: controller.acao.description);
    dataIniCtrl.value = TextEditingValue(
        text: DateFormat('dd/MM/yy').format(controller.acao.start));
    dataFimCtrl.value = TextEditingValue(
        text: DateFormat('dd/MM/yy').format(controller.acao.end));
    endCtrl.value = TextEditingValue(text: controller.acao.address);
  }

  @override
  void dispose() {
    tituloCtrl.dispose();
    maxPartCtrl.dispose();
    descCtrl.dispose();
    dataIniCtrl.dispose();
    dataFimCtrl.dispose();
    endCtrl.dispose();
    super.dispose();
  }

  DateTime _dateFromString(String date) {
    if (date != null && date.isNotEmpty) {
      try {
        DateTime result = DateFormat('dd/MM/yy').parse(date);
        return result;
      } catch (e) {
        // return null;
      }
      return null;
    }
  }

  _save() {
    controller.acao = controller.acao.copyWith(
      tituloCtrl.text,
      controller.acao.registeredBy,
      descCtrl.text,
      endCtrl.text,
      controller.acao.participantes,
      int.parse(maxPartCtrl.text),
      _dateFromString(dataIniCtrl.text),
      _dateFromString(dataFimCtrl.text),
      controller.acao.status,
      controller.acao.causas,
    );

    tituloCtrl.value = TextEditingValue(text: controller.acao.title);
    maxPartCtrl.value =
        descCtrl.value = TextEditingValue(text: controller.acao.description);
    dataIniCtrl.value = TextEditingValue(
        text: DateFormat('dd/MM/yy').format(controller.acao.start));
    dataFimCtrl.value = TextEditingValue(
        text: DateFormat('dd/MM/yy').format(controller.acao.end));
    endCtrl.value = TextEditingValue(text: controller.acao.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [AppWidgets.title('Editar', context), buttonSave()],
              ),
              Card(
                elevation: 6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // AppWidgets.div(1.5),
                    AppWidgets.switcher(context,
                        title: notifTitle, value: switchValue, onChanged: (_) {
                      setState(() {
                        switchValue = _;
                      });
                    }),
                    SizedBox(height: 10),
                    // title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                      child: TextField(
                        controller: tituloCtrl,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(6, 2, 6, 4),
                          labelText: 'Título',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // max parcipantes TODO: validator
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: TextField(
                        controller: maxPartCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(6, 2, 6, 4),
                          labelText: 'N⁰ Máximo de Participantes',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // descrição
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: TextField(
                        controller: descCtrl,
                        minLines: 4,
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(6, 14, 6, 4),
                          labelText: 'Descrição',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // data
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: TextField(
                        controller: dataIniCtrl,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(6, 14, 6, 4),
                          labelText: 'Data inicial',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: TextField(
                        controller: dataFimCtrl,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(6, 14, 6, 4),
                          labelText: 'Data final',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // local
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                      child: TextField(
                        controller: endCtrl,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(6, 2, 6, 4),
                          labelText: 'Local',
                          // hintStyle: TextStyle(fontSize: 20),
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                child: cancelButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cancelButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black12),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancelar',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          )),
    );
  }

  Widget buttonSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          _save();
          Navigator.of(context).pop();
        },
        child: Text(
          'Salvar',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
