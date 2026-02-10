import 'package:evently/core/firebase_functions.dart';
import 'package:evently/models/task_model.dart';
import 'package:flutter/material.dart';

class AddEventProvider extends ChangeNotifier{
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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

  void changeDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

  void changeTime(TimeOfDay time){
    selectedTime = time;
    notifyListeners();
  }

  addEvent(TaskModel taskModel) {
    FirebaseFunctions.createTask(taskModel);
    notifyListeners();
  }
}