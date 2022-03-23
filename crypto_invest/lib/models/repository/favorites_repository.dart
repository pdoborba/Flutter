import 'dart:collection';

import 'package:crypto_invest/models/moeda.dart';
import 'package:flutter/material.dart';

class FavoritesRepository extends ChangeNotifier {
  final List<Moeda> _list = [];

  UnmodifiableListView<Moeda> get list => UnmodifiableListView(_list);

  salveAll(List<Moeda> moedas) {
    for (var moeda in moedas) {
      if (!_list.contains(moeda)) _list.add(moeda);
    }
    notifyListeners();
  }

  remove(Moeda moeda) {
    _list.remove(moeda);
    notifyListeners();
  }
}
