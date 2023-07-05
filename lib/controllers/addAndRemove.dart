import 'package:assignment_2/models/restaurant.dart';
import 'package:flutter/material.dart';

class AAR extends ChangeNotifier{
  double _count = 0;
List<Restaurant> hh = [];
 void add(Restaurant i){
  hh.add(i);
  _count += i.tableMenuList[1].categoryDishes[0].dishPrice;
  notifyListeners();
 }
 void remove(Restaurant i){
  hh.remove(i);
  _count -= i.tableMenuList[1].categoryDishes[0].dishPrice;
  notifyListeners();
 }
 
 int get count{
  return hh.length;
 }

 double get total{
  return _count;
 }

 List<Restaurant> get cart {
  return hh;
 }
  }
