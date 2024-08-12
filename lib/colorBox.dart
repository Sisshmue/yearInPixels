import 'package:flutter/material.dart';
import 'package:year_in_pixels/colorProvider.dart';
import 'package:provider/provider.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            k_colorBox(color: Colors.red),
            SizedBox(
              width: 10,
            ),
            k_colorBox(color: Colors.green),
            SizedBox(
              width: 10,
            ),
            k_colorBox(
              color: Colors.yellow.shade100,
            ),
            SizedBox(
              width: 10,
            ),
            k_colorBox(color: Colors.black),
            SizedBox(
              width: 10,
            ),
            k_colorBox(
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            k_colorBox(color: Colors.purple),
            SizedBox(
              width: 10,
            ),
            k_colorBox(color: Colors.pinkAccent),
            SizedBox(
              width: 10,
            ),
            k_colorBox(
              color: Colors.indigo,
            ),
            SizedBox(
              width: 10,
            ),
            k_colorBox(color: Colors.grey),
            SizedBox(
              width: 10,
            ),
            k_colorBox(
              color: Colors.lime,
            ),
          ],
        )
      ],
    );
  }
}

class k_colorBox extends StatelessWidget {
  Color color;

  k_colorBox({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    //For Provider
    var colorProvider = Provider.of<ColorProvider>(context);

    return GestureDetector(
      onTap: () {
        if (colorProvider.getCirNum == 1) {
          colorProvider.setBoxColor1(color);
        } else if (colorProvider.getCirNum == 2) {
          colorProvider.setBoxColor2(color);
        } else if (colorProvider.getCirNum == 3) {
          colorProvider.setBoxColor3(color);
        } else if (colorProvider.getCirNum == 4) {
          colorProvider.setBoxColor4(color);
        } else if (colorProvider.getCirNum == 5) {
          colorProvider.setBoxColor5(color);
        }
        //colorProvider.setBoxColor1(color);
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
