// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cen6.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cen6Controller on _Cen6ControllerBase, Store {
  final _$isNotifOnAtom = Atom(name: '_Cen6ControllerBase.isNotifOn');

  @override
  bool get isNotifOn {
    _$isNotifOnAtom.reportRead();
    return super.isNotifOn;
  }

  @override
  set isNotifOn(bool value) {
    _$isNotifOnAtom.reportWrite(value, super.isNotifOn, () {
      super.isNotifOn = value;
    });
  }

  @override
  String toString() {
    return '''
isNotifOn: ${isNotifOn}
    ''';
  }
}
