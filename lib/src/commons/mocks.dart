import 'package:intl/intl.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:maosunidas/src/utils/assets.dart';
import 'package:maosunidas/src/utils/ipsums.dart';

class MockVoluntarios {
  static final List<Voluntario> all = [
    Voluntario('Patrick', '89098123', 'debaixo de uma pedra',
        'patrick@email.com', 'estrela do mar'),
    Voluntario('Bob Esponja Calça Quadrada', '840123132', 'casa-abacaxi',
        'bobeponja@email.com', 'cozinheiro'),
    Voluntario('Lula Molusco', '12312312', 'Casa do lula molusco',
        'lulamolusco@email.com', 'musico'),
    Voluntario('Sirigueijo Vermelho', '12412412', 'no banco mais próximo',
        'sirigueijo@email.com', 'empresário'),
    Voluntario('Sra. Puff', '12312313', 'perto da autoescola',
        'srapuff@email.com', 'professora'),
    Voluntario('Gary o caracol', '412412412', 'casa-abacaxi',
        'garyAmaBob@email.com', 'atleta'),
    Voluntario('Sandy Bochechas', '123131212', 'Aquário debaixo d\'água',
        'sandy@email.com', 'cientista'),
  ];

  static Voluntario bessa = Voluntario('Bessa', '1214124123',
      'Rua dos Formandos, n⁰23', 'bessa@email.com', 'Analista de Sistemas');

  static Voluntario italo = Voluntario('Italo', '42352523',
      'Rua do amanhecer, n⁰123', 'italo@email.com', 'Cientista da computação');
}

class MockAcoes {
  static List<Acao> all = [
    Acao(
      'Ação do Amanhecer',
      MockVoluntarios.bessa,
      Ipsums.paragraph1,
      'Rua do amanhecer, n⁰123',
      MockVoluntarios.all,
      20,
      DateTime.parse('2021-09-01 20:18:12Z'),
      DateTime.parse('2021-10-01 20:18:12Z'),
      AcaoStatus.emAndamento,
      [Causas.eduInfantil],
    ),
    Acao(
      'Dia da Criança',
      MockVoluntarios.italo,
      Ipsums.paragraph1,
      'Rua do amanhecer, n⁰123',
      MockVoluntarios.all,
      MockVoluntarios.all.length,
      DateTime.parse('2021-10-12 20:18:12Z'),
      DateTime.parse('2021-10-12 20:18:12Z'),
      AcaoStatus.emAndamento,
      [Causas.eduInfantil],
    ),
  ];
}

class MockTimelinePost {
  static List<TimelinePost> all = [
    TimelinePost(DateFormat('dd/MM/yy').parse('12/04/21'), Ipsums.paragraph1,
        MockAcoes.all.last, AppAssets.children0, MockVoluntarios.italo),
    TimelinePost(DateFormat('dd/MM/yy').parse('04/08/21'), Ipsums.paragraph1,
        MockAcoes.all.first, AppAssets.children, MockVoluntarios.bessa),
  ];
}
