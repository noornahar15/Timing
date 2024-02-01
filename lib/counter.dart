import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{

  int _countVal = 0;

  int get countVal => _countVal;

  void add (){
    _countVal += 2;
  }
}