import 'dart:math';
import 'dart:ui';

Color getRandomColor() {

  var randomNumberList = [
    Color(0xFF41276D),
    Color(0xFFD94F00),
    Color(0xFF0066F5),
    Color(0xFFD71920),
    Color(0xFF173F5F),
    Color(0xFF3CAEA3),
    Color(0xFF20639B),
    Color(0xFFED553B),
    Color(0xFF581845),
    Color(0xFF584815),
    Color(0xFF900C3F),
    Color(0xFFFFC305),
    Color(0xFFFF5733),
    Color(0xFFC70039),
  ];

    return (randomNumberList..shuffle()).first;
  }
