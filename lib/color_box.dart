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
            KColorBox(color: Colors.red),
            const SizedBox(
              width: 10,
            ),
            KColorBox(color: Colors.green),
            const SizedBox(
              width: 10,
            ),
            KColorBox(
              color: Colors.yellow.shade100,
            ),
            const SizedBox(
              width: 10,
            ),
            KColorBox(color: Colors.black),
            const SizedBox(
              width: 10,
            ),
            KColorBox(
              color: Colors.blue,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KColorBox(color: Colors.purple),
            const SizedBox(
              width: 10,
            ),
            KColorBox(color: Colors.pinkAccent),
            const SizedBox(
              width: 10,
            ),
            KColorBox(
              color: Colors.indigo,
            ),
            const SizedBox(
              width: 10,
            ),
            KColorBox(color: Colors.grey),
            const SizedBox(
              width: 10,
            ),
            KColorBox(
              color: Colors.lime,
            ),
          ],
        )
      ],
    );
  }
}

class KColorBox extends StatelessWidget {
  Color color;

  KColorBox({
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
