import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List<String> categories = [
    'Birthday',
    'Meeting',
    'Book Club',
    'Exhibition',
    'Sport',
  ];

  void changeIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }
}