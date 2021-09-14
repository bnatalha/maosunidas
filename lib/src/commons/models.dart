import 'package:flutter/foundation.dart';

class Voluntario {
  Voluntario(
    this.name,
    this.phone,
    this.address,
    this.email,
    this.profession,
  );

  final String name;
  final String phone;
  final String address;
  final String email;
  final String profession;
}

enum AcaoStatus { emAndamento, agendada }

extension AcaoStatusExt on AcaoStatus {
  String get name {
    switch (this) {
      case AcaoStatus.emAndamento:
        return 'Em Andamento';
        break;
      default:
        return 'Agendado';
    }
  }
}

class Acao {
  final String title;
  final Voluntario registeredBy;
  final String description;
  final String address;
  final List<Voluntario> participantes;
  final int maxParticipants;
  final DateTime start;
  final DateTime end;
  final AcaoStatus status;
  final List<String> causas;

  Acao(
    this.title,
    this.registeredBy,
    this.description,
    this.address,
    this.participantes,
    this.maxParticipants,
    this.start,
    this.end,
    this.status,
    this.causas,
  );

  copyWith([
    String title,
    Voluntario registeredBy,
    String description,
    String address,
    List<Voluntario> participantes,
    int maxParticipants,
    DateTime start,
    DateTime end,
    AcaoStatus status,
    List<String> causas,
  ]) {
    return Acao(
      title ?? this.title,
      registeredBy ?? this.registeredBy,
      description ?? this.description,
      address ?? this.address,
      participantes ?? this.participantes,
      maxParticipants ?? this.maxParticipants,
      start ?? this.start,
      end ?? this.end,
      status ?? this.status,
      causas ?? this.causas,
    );
  }
}

class Causas {
  static const String eduInfantil = 'Educação Infantil';
  static const String eduDigital = 'Educação Digital';
  static const String eduIdosos = 'Educação de Idosos';
}

class Ong {
  final String name;

  Ong(this.name);
}

class TimelinePost {
  final DateTime registeredAt;
  final String description;
  final Acao acaoAssociada;
  final String photoPath;
  final Voluntario author;

  TimelinePost(
    this.registeredAt,
    this.description,
    this.acaoAssociada,
    this.photoPath,
    this.author,
  );
}
