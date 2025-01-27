import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  int cirNum = 0;
  Color kColor = Colors.white10;
  String pText = 'How was your day like?';
  Color k_boxColor1 = Colors.green;
  Color k_boxColor2 = Colors.orangeAccent;
  Color k_boxColor3 = Colors.blueAccent;
  Color k_boxColor4 = Colors.red;
  Color k_boxColor5 = Colors.black;

  Color get getColor => kColor;
  String get getpText => pText;
  Color get getBoxColor1 => k_boxColor1;
  Color get getBoxColor2 => k_boxColor2;
  Color get getBoxColor3 => k_boxColor3;
  Color get getBoxColor4 => k_boxColor4;
  Color get getBoxColor5 => k_boxColor5;
  int get getCirNum => cirNum;

  void setCirnum(int cirNum) {
    this.cirNum = cirNum;
    notifyListeners();
  }

  void setColor(Color color) {
    kColor = color;
    notifyListeners();
  }

  void setText(String text) {
    pText = text;
    notifyListeners();
  }

  void setBoxColor1(Color color) {
    k_boxColor1 = color;
    notifyListeners();
  }

  void setBoxColor2(Color color) {
    k_boxColor2 = color;
    notifyListeners();
  }

  void setBoxColor3(Color color) {
    k_boxColor3 = color;
    notifyListeners();
  }

  void setBoxColor4(Color color) {
    k_boxColor4 = color;
    notifyListeners();
  }

  void setBoxColor5(Color color) {
    k_boxColor5 = color;
    notifyListeners();
  }
}
