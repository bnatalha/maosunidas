import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:maosunidas/src/app.dart';
import 'package:get_it/get_it.dart';
import 'package:maosunidas/src/cenarios/cen3/timeline/timeline.controller.dart';
import 'package:maosunidas/src/cenarios/cen6/cen6.controller.dart';
import 'package:maosunidas/src/commons/screens/acao/acao.controller.dart';
import 'package:maosunidas/src/utils/notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // setup services
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(Cen6Controller());
  GetIt.I.registerSingleton(AcaoController());
  GetIt.I.registerSingleton(TimelineController());
  GetIt.I.registerSingleton(FlutterLocalNotificationsPlugin());

  setupNotifs().then((_) => runApp(MaosUnidasApp()));
}
