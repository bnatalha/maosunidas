import 'package:maosunidas/src/commons/mocks.dart';
import 'package:mobx/mobx.dart';

import '../../models.dart';
part 'acao.controller.g.dart';

class AcaoController = _AcaoControllerBase with _$AcaoController;

abstract class _AcaoControllerBase with Store {
  @observable
  Acao acao = MockAcoes.all.first;

  @observable
  bool isUserFromTheOng = false;
}
