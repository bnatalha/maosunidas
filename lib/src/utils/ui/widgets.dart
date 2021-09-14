import 'package:flutter/material.dart';

class AppWidgets {
  static Widget title(String text, BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.clip,
        ),
      );

  static Widget switcher(BuildContext context,
          {@required String title,
          String subtitle = '',
          @required bool value,
          Function(bool) onChanged}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Icon(Icons.notifications_active),
              title: Text(title),
              trailing: Switch(onChanged: onChanged ?? (_) {}, value: value),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey),
            )
          ],
        ),
      );

  static Divider div([double thickness = 1]) =>
      Divider(color: Colors.black, thickness: thickness);

  static Widget postHeader([String autor = '', double elevation = 6]) => Card(
        elevation: elevation,
        child: ListTile(
          leading: Container(
            width: 35,
            height: 40,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Container(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Icon(
                      Icons.group,
                      size: 20,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          title: Text(autor),
          subtitle: Text('Fundação Amanhecer'),
        ),
      );
}
