import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen1/searchbar/searchbar.widget.dart';
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

    super.initState();
  }

  @override
  void dispose() {
    if (searchController != null) {
      searchController.dispose();
    }
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DefaultAppBar(),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.title('Pesquisar Ações', context),
              Expanded(
                child: Center(
                  child: AppSearchBar(
                    textController: searchController,
                    enabled: false,
                    onTap: () {
                      print('ASDFASDF');
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
