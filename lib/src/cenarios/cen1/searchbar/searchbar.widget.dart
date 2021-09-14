import 'package:flutter/material.dart';
import 'package:maosunidas/src/cenarios/cen1/searchbar/open_search.screen.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar(
      {Key key,
      @required this.textController,
      this.enabled = false,
      this.onTap})
      : super(key: key);

  final TextEditingController textController;
  final bool enabled;
  final Function onTap;

  @override
  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  FocusNode focusNode;

  @override
  void initState() {
    // FocusNode focusNode = FocusScope.of(context).
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('asfawef');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => OpenSearchScreen()));
      },
      child: IgnorePointer(
        ignoring: !widget.enabled,
        child: TextField(
          onTap: () {
            if (widget.enabled) {
              return;
            } else {
              focusNode.nextFocus();
              (widget?.onTap ?? () {})();
            }
          },
          controller: widget.textController,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            hintText: 'Digite uma Causa',
          ),
        ),
      ),
    );
  }
}
