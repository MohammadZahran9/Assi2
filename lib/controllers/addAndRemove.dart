import 'package:assignment_2/models/restaurant.dart';
import 'package:flutter/material.dart';



class AAR extends ChangeNotifier{
  double _count = 0;
List<Restaurant> HH = [];
 void add(Restaurant i){
  HH.add(i);
  _count += i.tableMenuList[1].categoryDishes[0].dishPrice;
  notifyListeners();
 }
 int get count{
  return HH.length;
 }

 double get total{
  return _count;
 }
  }
