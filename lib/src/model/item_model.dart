import 'dart:math';

import 'package:flutter/material.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = <Item>[];

  String getTitle(int index) => _items[index].title;
  Color getColor(int index) => _items[index].color;
  int get itemCount => _items.length;

  addItem(String title) {
    _items.add(
      Item(title, Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    );
    notifyListeners();
  }

  editItem(String title, int index) {
    _items[index].title = title;
    notifyListeners();
  }

  remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

class Item {
  String title;
  final Color color;
  Item(this.title, this.color);
}
