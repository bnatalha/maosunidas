import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen1/searchbar/searchbar.widget.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.screen.dart';
import 'package:maosunidas/src/commons/screens/acao_list/acao_list.screen.dart';
import 'package:maosunidas/src/utils/notifications.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();

    /////
    subscription =
        selectNotificationSubject.stream.listen((String payload) async {
      if (payload != null && payload == NotifPayloads.openAcao) {
        await Navigator.push(
            context, MaterialPageRoute(builder: (_) => AcaoScreen()));
      }
    });

    super.initState();
  }

  StreamSubscription<String> subscription;

  @override
  void dispose() {
    if (searchController != null) {
      searchController.dispose();
    }

    if (subscription != null) {
      subscription.cancel();
    }
    super.dispose();
  }

  String selectedCausa = Causas.all.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.title('Pesquisar Ações', context),
            // Text(selectedCausa),
            Spacer(),
            Center(
              child: AutoCompleteTextField(
                controller: searchController,
                enabled: true,
                heroTag: 'searchbar',
                hintText: 'Digite uma causa',
                leadingIcon: Icon(Icons.search),
                values: Causas.all
                    .map((String causa) =>
                        AutoCompleteValuePair<dynamic>(causa, causa))
                    .toList(),
                updatePairValue: (AutoCompleteValuePair<dynamic> _) {
                  setState(() {
                    selectedCausa = _.value as String;
                  });
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => AcaoListScreen()));
                },
                postUpdate: () async {
                  // Future.delayed(Duration(milliseconds: 200)).then((value) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AcaoListScreen(
                            causa: selectedCausa,
                          )));
                  // });
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
