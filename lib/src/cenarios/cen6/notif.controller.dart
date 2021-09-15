import 'package:mobx/mobx.dart';
part 'notif.controller.g.dart';

class NotifController = _NotifControllerBase with _$NotifController;

abstract class _NotifControllerBase with Store {
  @observable
  bool isNotifOn = false;
}
