import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  int cirnum = 0;
  Color kcolor = Colors.white10;
  String pText = 'How was your day like?';
  Color k_boxColor1 = Colors.white10;
  Color k_boxColor2 = Colors.white10;
  Color k_boxColor3 = Colors.white10;
  Color k_boxColor4 = Colors.white10;
  Color k_boxColor5 = Colors.white10;

  Color get getColor => kcolor;
  String get getpText => pText;
  Color get getBoxColor1 => k_boxColor1;
  Color get getBoxColor2 => k_boxColor2;
  Color get getBoxColor3 => k_boxColor3;
  Color get getBoxColor4 => k_boxColor4;
  Color get getBoxColor5 => k_boxColor5;
  int get getCirNum => cirnum;

  void setCirnum(int cirNum) {
    cirnum = cirNum;
    notifyListeners();
  }

  void setColor(Color color) {
    kcolor = color;
    notifyListeners();
  }

  void setText(String text) {
    pText = text;
    notifyListeners();
  }

  // void setBox(Color color) {
  //   if (cirnum == 1) {
  //     k_boxColor1 = color;
  //     notifyListeners();
  //   } else if (cirnum == 2) {
  //     k_boxColor2 = color;
  //     notifyListeners();
  //   }
  // }

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
