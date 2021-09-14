import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.controller.dart';
import 'package:maosunidas/src/commons/mocks.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/utils/assets.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  TimelineController get controller => GetIt.I.get();

  TextEditingController descCtrl;

  @override
  void initState() {
    descCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.title('Nova Postagem', context),
                postButton()
              ],
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: descCtrl,
                    maxLines: 5,
                    minLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Descrição'),
                  ),
                  acaoField(),
                  photoSection(),
                  cancelButton(),
                ]
                    .map((e) =>
                        Container(margin: const EdgeInsets.all(8), child: e))
                    .toList(),
              ),
            ),
          ]
              .map((e) => Container(margin: const EdgeInsets.all(4), child: e))
              .toList(),
        ),
      ),
    );
  }

  bool showThumbnails = false;

  Widget photoSection() {
    final photoIcon = Padding(
        padding: EdgeInsets.all(16),
        child: Icon(Icons.add_a_photo, size: 70, color: Colors.black));
    return showThumbnails
        ? Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(color: Colors.black26),
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(AppAssets.children1, width: 140),
                          // SizedBox(width: 5),
                          // Image.asset(AppAssets.children2, width: 140),
                        ],
                      ),
                    ),
                    Spacer(),
                    photoIcon,
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Fotos Adicionadas',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Spacer(),
              TextButton(
                child: photoIcon,
                onPressed: () {
                  if (!showThumbnails) {
                    setState(() {
                      showThumbnails = true;
                    });
                  }
                },
              )
            ],
          );
  }

  Acao selectedAction = MockAcoes.all.first;

  Widget acaoField() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.all(4),
      child: DropdownButton(
        elevation: 0,
        underline: Container(),
        isExpanded: true,
        hint: Text('Selecione uma ação associada'),
        value: selectedAction,
        items: MockAcoes.all
            .map((acao) => DropdownMenuItem<Acao>(
                  value: acao,
                  child: Text(acao.title),
                ))
            .toList(),
        onChanged: (_) {
          setState(() {
            selectedAction = _;
          });
        },
      ),
    );
  }

  Future<bool> _post() async {
    if (descCtrl.text == null || descCtrl.text.isEmpty) {
      return await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('A descrição não pode estar vazia!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    } else {
      controller.posts.add(TimelinePost(
          DateTime.now(),
          descCtrl.text,
          selectedAction,
          showThumbnails ? AppAssets.children1 : null,
          MockVoluntarios.bessa));
      return true;
    }
  }

  Widget postButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () async {
        bool success = await _post();
        if (success) {
          Navigator.of(context).pop();
        }
      },
      child: Text(
        'Postar',
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
      ),
    );
  }

  Widget cancelButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
}
