import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/models/card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'card_store.g.dart';

class CardStore = CardStoreBase with _$CardStore;

abstract class CardStoreBase with Store {
  @observable
  List<CardModel> cardList = [];

  @observable
  String newDescription = '';

  late SharedPreferences _prefs;

  @action
  Future init() async {
    _prefs = await SharedPreferences.getInstance();

    final savedCards = _prefs.getStringList('cards');

    if (savedCards != null && savedCards.isNotEmpty) {
      cardList =
          savedCards.map((cardData) => CardModel.fromJson(cardData)).toList();
    }
  }

  @action
  Future saveCards() async {
    final List<String> cardDataList =
        cardList.map((card) => card.toJson()).toList();

    await _prefs.setStringList('cards', cardDataList);
  }

  @action
  Future addCard(String description) async {
    final card = CardModel(description: description);
    cardList.add(card);

    await _prefs.setStringList(
        'cards', cardList.map((card) => card.toJson()).toList());
  }

  @action
  Future removeCard(CardModel card) async {
    cardList.removeWhere((x) => x == card);

    await _prefs.setStringList(
        'cards', cardList.map((card) => card.toJson()).toList());
  }
}
