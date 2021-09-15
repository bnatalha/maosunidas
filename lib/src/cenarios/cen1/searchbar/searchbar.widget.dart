import 'package:flutter/material.dart';

const Color _unselectedColor = Color(0xFF4F4F4F);
const Color _screenBackground = Colors.white;

class AutoCompleteValuePair<T> {
  AutoCompleteValuePair(this.text, this.value);

  final String text;
  final T value;

  @override
  String toString() {
    return '$text: $value';
  }
}

class AutoCompleteTextField extends StatefulWidget {
  const AutoCompleteTextField(
      {Key key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.values,
      this.enabled = true,
      @required this.heroTag,
      @required this.controller,
      @required this.updatePairValue,
      this.postUpdate,
      this.leadingIcon})
      : super(key: key);

  final String hintText;
  final String labelText;
  final String helperText;
  final String heroTag;
  final Icon leadingIcon;
  final bool enabled;
  final TextEditingController controller;
  final void Function(AutoCompleteValuePair<dynamic>) updatePairValue;
  final Function postUpdate;
  final List<AutoCompleteValuePair<dynamic>> values;

  @override
  _AutoCompleteTextFieldState createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled ? _triggerTransition : null,
      child: IgnorePointer(
        ignoring: true,
        child: _CustomTextField(
          enable: widget.enabled,
          autofocus: false,
          leadingIcon: widget?.leadingIcon,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          textController: widget.controller,
        ),
      ),
    );
  }

  void _triggerTransition() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return _AutoCompleteArea(
          onTapItem: onTapItem,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          values: widget.values,
          leadingIcon: widget?.leadingIcon,
          heroTag: widget.heroTag,
          textController: widget.controller,
        );
      }),
    );
  }

  void onTapItem(AutoCompleteValuePair<dynamic> pairValue) {
    widget.controller.value = TextEditingValue(text: pairValue.text);
    widget.updatePairValue(pairValue);
    Navigator.of(context).pop();
    (widget?.postUpdate ?? () {}).call();
  }
}

class _CustomTextField extends StatefulWidget {
  const _CustomTextField({
    Key key,
    @required this.enable,
    @required this.autofocus,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.helperText,
    this.textController,
    this.leadingIcon,
  }) : super(key: key);

  final TextEditingController textController;
  final bool enable;
  final bool autofocus;
  final void Function(String p1) onChanged;
  final String hintText;
  final String labelText;
  final String helperText;
  final Icon leadingIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                widget.labelText ?? '',
                // style: TextStyle
              ),
              // margin: const EdgeInsets.only(top: 12, bottom: 0),
            ),
            TextFormField(
              enabled: widget.enable ?? false,
              controller: widget.textController,
              onChanged: widget.onChanged ?? (String _) {},
              autofocus: widget.autofocus ?? false,
              maxLines: 1,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                contentPadding: const EdgeInsets.only(top: 25),
                hintText: widget.hintText ?? '',
                // labelText: '',
                prefixIcon: widget?.leadingIcon ?? Container(),
                // suffixIcon: const Padding(
                //   child: Icon(Icons.expand_more_sharp),
                //   padding: EdgeInsets.only(top: 10, left: 15),
                // ),
                helperText: widget.helperText ?? '',
                helperStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xFF999999),
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: _unselectedColor,
              ),
            ),
          ],
        ));
  }
}

class _AutoCompleteArea extends StatefulWidget {
  const _AutoCompleteArea({
    Key key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.heroTag,
    this.values,
    this.onTapItem,
    this.textController,
    this.leadingIcon,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final String helperText;
  final String heroTag;
  final TextEditingController textController;
  final void Function(AutoCompleteValuePair<dynamic>) onTapItem;
  final List<AutoCompleteValuePair<dynamic>> values;
  final Icon leadingIcon;

  @override
  _AutoCompleteAreaState createState() => _AutoCompleteAreaState();
}

class _AutoCompleteAreaState extends State<_AutoCompleteArea> {
  List<AutoCompleteValuePair<dynamic>> filteredValues =
      <AutoCompleteValuePair<dynamic>>[];

  @override
  void initState() {
    filteredValues.addAll(widget.values);
    super.initState();
  }

  Widget autoCompleteArea() {
    return Hero(
      tag: widget.heroTag,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: _screenBackground,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey.shade700,
                      size: 20,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              _CustomTextField(
                leadingIcon: widget?.leadingIcon,
                enable: true,
                autofocus: true,
                onChanged: _filter,
                hintText: widget.hintText,
                labelText: widget.labelText,
                helperText: widget.helperText,
                textController: widget.textController,
              ),
              Expanded(
                child: Container(child: _valueList),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _valueList {
    // if (filteredValues.isEmpty) {
    //   return const CustomUIMessage();
    // }

    return ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (BuildContext _, int i) => const Divider(),
        itemCount: filteredValues.length,
        itemBuilder: (BuildContext _, int i) {
          return _buildItem(filteredValues[i], widget.onTapItem);
        });
  }

  Widget _buildItem(AutoCompleteValuePair<dynamic> pairValue,
      void Function(AutoCompleteValuePair<dynamic>) onTapItem) {
    return ListTile(
      onTap: () {
        onTapItem(pairValue);
        setState(() {});
      },
      title: Text(pairValue.text),
    );
  }

  void _filter(String filter) {
    print('AUTOCOMPLETE VAL:$filter');
    filteredValues.clear();
    setState(() {
      filteredValues.addAll(
          widget.values.where((AutoCompleteValuePair<dynamic> pairValue) {
        print(
            '${pairValue.text.toLowerCase()}: ${pairValue.text.contains(filter.toLowerCase())}');
        return pairValue.text.toLowerCase().contains(filter.toLowerCase());
      }).toList());
      print(filteredValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: autoCompleteArea(),
    );
  }
}
