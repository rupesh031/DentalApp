import 'package:flutter/material.dart';

const mainGrad = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff002E5B),
    Color(0xff122730),
  ],
);

const secondaryGrad = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    Color(0xffD4D4D4),
    Color(0xff9B9C9C),
  ],
);

final Shader textGrad = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: <Color>[Color(0xff19ECC6), Color.fromARGB(255, 244, 220, 5)],
).createShader(Rect.fromLTWH(100.0, 50, 70.0, 90));

const reportGrad = LinearGradient(
  colors: [
    Color.fromRGBO(239, 239, 239, 0.10),
    Color.fromRGBO(239, 239, 239, 0.17),
    Color.fromRGBO(239, 239, 239, 0.12),
    Color.fromRGBO(239, 239, 239, 0.10),
  ],
  stops: [0, 0.305, 0.6376, 0.9844],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const greyGrad = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff79AEC2),
    Color.fromRGBO(0, 84, 166, 0),
  ],
);

const buttonGrad = LinearGradient(colors: [
  Color.fromRGBO(255, 255, 255, 150),
  Color.fromRGBO(255, 255, 255, 200),
  Color.fromRGBO(255, 255, 255, 150),
], stops: [
  0.10,
  0.5,
  1
], begin: Alignment.centerLeft, end: Alignment.centerRight);
