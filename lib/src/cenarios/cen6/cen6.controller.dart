import 'package:mobx/mobx.dart';
part 'cen6.controller.g.dart';

class Cen6Controller = _Cen6ControllerBase with _$Cen6Controller;

abstract class _Cen6ControllerBase with Store {
  @observable
  bool isNotifOn = false;
}
