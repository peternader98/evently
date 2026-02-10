import 'package:flutter/material.dart';

class AddEventProvider extends ChangeNotifier{
  int selectedIndex = 0;

  List<String> categories = [
    'birthday',
    'meeting',
    'book_club',
    'exhibition',
    'sport',
  ];

  void changeIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }
}