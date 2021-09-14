import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/new_post.screen.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.controller.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/utils/ui/appbar.widget.dart';
import 'package:maosunidas/src/utils/ui/widgets.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key key}) : super(key: key);

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  TimelineController get controller => GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NewPostScreen()));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 60,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Observer(
          builder: (BuildContext context) => ListView.builder(
            itemBuilder: (_, i) => i != controller.posts.length
                ? buildPost(controller.posts[(controller.posts.length - 1) - i])
                : SizedBox(height: 100),
            itemCount: controller.posts.length + 1,
          ),
        ),
      ),
    );
  }

  Widget buildPost(TimelinePost post) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.div(),
          AppWidgets.postHeader(post.author.name, 0),
          if (post.photoPath != null && post.photoPath.isNotEmpty)
            Image.asset(post.photoPath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      DateFormat('dd/MM/yy H:m:s').format(post.registeredAt),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      post.acaoAssociada.title,
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 16),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Text(post.description),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Text(
                      'Leia Mais',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                )
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
