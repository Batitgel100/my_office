import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  static const Color mainColor = Color(0xff3fa29d);
  static const Color background = Color(0xFFf2f6ff);
  static const Color loginGradientStart = Color(0xFF59499E);
  static const Color loginGradientEnd = Color(0xFF59499E);
  static const Color successGreen = Color(0xFF32CD32);
  static const Color secondaryColor = Color(0xFFffa302);
  static const Color thirdColor = Color(0xFFFFD684);
  static const Color fourthColor = Color(0xFF8FDCFF);
  static const Color elementBack = Color(0xfff1efef);
  static const Color titleColor = Color(0xFF061857);
  static const Color subTitle = Color(0xFFa4adbe);
  static const Color textMain = Color(0xFF848484);
  static const Color greyBack = Color(0xFFced4db);
  static const Color grey = Color(0xFfc2c8c6);
  static const Color greyForm = Color(0xFFcaced4);
  static const Color red = Color(0xFFE74C3C);
  static const Color orange = Color(0xFFff6348);
  static const Color strongGrey = Color(0xFFced4db);
  static const Color secondBlack = Color(0xFF515C6F);
  static const Color facebookBlue = Color(0xFF1877f2);

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF5BC0FF), Color(0xFF0063FF)],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const cardGradient = LinearGradient(
    colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class TextStyles {
  static const TextStyle white17semibold = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle white17 = TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
  static const TextStyle white14semibold = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle white14 = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle black17semibold = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle black17 = TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
  static const TextStyle black14semibold = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle black14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
}
