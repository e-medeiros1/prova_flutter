// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on CardStoreBase, Store {
  late final _$cardListAtom =
      Atom(name: 'CardStoreBase.cardList', context: context);

  @override
  List<CardModel> get cardList {
    _$cardListAtom.reportRead();
    return super.cardList;
  }

  @override
  set cardList(List<CardModel> value) {
    _$cardListAtom.reportWrite(value, super.cardList, () {
      super.cardList = value;
    });
  }

  late final _$newDescriptionAtom =
      Atom(name: 'CardStoreBase.newDescription', context: context);

  @override
  String get newDescription {
    _$newDescriptionAtom.reportRead();
    return super.newDescription;
  }

  @override
  set newDescription(String value) {
    _$newDescriptionAtom.reportWrite(value, super.newDescription, () {
      super.newDescription = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('CardStoreBase.init', context: context);

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$saveCardsAsyncAction =
      AsyncAction('CardStoreBase.saveCards', context: context);

  @override
  Future<dynamic> saveCards() {
    return _$saveCardsAsyncAction.run(() => super.saveCards());
  }

  late final _$addCardAsyncAction =
      AsyncAction('CardStoreBase.addCard', context: context);

  @override
  Future<dynamic> addCard(String description) {
    return _$addCardAsyncAction.run(() => super.addCard(description));
  }

  late final _$removeCardAsyncAction =
      AsyncAction('CardStoreBase.removeCard', context: context);

  @override
  Future<dynamic> removeCard(CardModel card) {
    return _$removeCardAsyncAction.run(() => super.removeCard(card));
  }

  @override
  String toString() {
    return '''
cardList: ${cardList},
newDescription: ${newDescription}
    ''';
  }
}
