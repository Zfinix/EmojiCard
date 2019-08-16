import 'package:flutter/material.dart';
import 'package:provider_example/model/cardModel.dart';

class HomeController with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _searchText;
  String get searchText => _searchText;

  List<CardModel> _cardList = [];
  List<CardModel> get cardList => _cardList;

  CardModel _newCard;
  CardModel get newCard => _newCard;

  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void removeCard() {
    if (_cardList.length > 0) _cardList.removeAt(_currentIndex);
    notifyListeners();
  }

  void populateCardList() {
    _cardList.insert(
      0,
      CardModel(emoji: '💖', title: 'My Heart', subtitle: 'All for you'),
    );
    notifyListeners();
  }

  void addCard() {
    if (_newCard != null) _cardList.add(_newCard);
    _newCard = null;
    notifyListeners();
  }

  set setCurrentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  set isSearching(val) {
    _isSearching = val;
    notifyListeners();
  }

  set setNewCard(CardModel val) {
    _newCard = val;
    notifyListeners();
  }

  set searchText(val) {
    _searchText = val;
    notifyListeners();
  }
}
