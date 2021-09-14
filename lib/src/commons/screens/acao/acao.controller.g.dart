// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acao.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AcaoController on _AcaoControllerBase, Store {
  final _$acaoAtom = Atom(name: '_AcaoControllerBase.acao');

  @override
  Acao get acao {
    _$acaoAtom.reportRead();
    return super.acao;
  }

  @override
  set acao(Acao value) {
    _$acaoAtom.reportWrite(value, super.acao, () {
      super.acao = value;
    });
  }

  final _$isUserFromTheOngAtom =
      Atom(name: '_AcaoControllerBase.isUserFromTheOng');

  @override
  bool get isUserFromTheOng {
    _$isUserFromTheOngAtom.reportRead();
    return super.isUserFromTheOng;
  }

  @override
  set isUserFromTheOng(bool value) {
    _$isUserFromTheOngAtom.reportWrite(value, super.isUserFromTheOng, () {
      super.isUserFromTheOng = value;
    });
  }

  @override
  String toString() {
    return '''
acao: ${acao},
isUserFromTheOng: ${isUserFromTheOng}
    ''';
  }
}
