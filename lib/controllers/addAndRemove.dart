import 'package:assignment_2/models/restaurant.dart';
import 'package:flutter/material.dart';

class AAR extends ChangeNotifier {
  int g = 0 ;
  double _count = 0;
  List<Restaurant> hh = [];

  void add(Restaurant i , int index) {
    hh.add(i);
    g +=count;
    _count += i.tableMenuList[1].categoryDishes[index].dishPrice;
    notifyListeners();
  }

  void remove(Restaurant i, int h) {
    hh.remove(i);
    _count -= i.tableMenuList[1].categoryDishes[h].dishPrice;
    notifyListeners();
  }

  int get count {
    return hh.length;
  }

  double get total {
    return _count;
  }

  List<Restaurant> get cart {
    return hh;
  }
}