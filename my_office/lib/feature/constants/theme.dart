import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static const Color white = Colors.white;
  static const Color mainColor = Color(0xff3fa29d);
  static const Color background = Color(0xFFf2f6ff);
  static const Color loginGradientStart = Color(0xFF59499E);
  static const Color loginGradientEnd = Color(0xFF59499E);
  static const Color successGreen = Color(0xFF32CD32);
  static const Color secondaryColor = Color.fromARGB(255, 245, 152, 110);
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
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white16semibold = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  static const TextStyle white15semibold = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white11semibold = TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white12semibold = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white22semibold = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle black22semibold = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle black20 = TextStyle(
    color: Colors.black,
    fontSize: 20,
    // fontWeight: FontWeight.w600,
  );
  static const TextStyle black25 = TextStyle(
    color: Colors.black,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
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
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis);
  static const TextStyle black17 = TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
  static const TextStyle black14semibold = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle grey14semibold = TextStyle(
    color: Color.fromARGB(255, 114, 114, 114),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle grey12semibold = TextStyle(
    color: Color.fromARGB(255, 114, 114, 114),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle black14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  static const TextStyle black13 = TextStyle(
    color: Colors.black,
    fontSize: 13,
  );
  static const TextStyle black12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  static const TextStyle black16semibold = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle black15semibold = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle black11semibold = TextStyle(
    color: Colors.black,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle main17semibold = TextStyle(
    color: AppColors.mainColor,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle main16semibold = TextStyle(
    color: AppColors.mainColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle main15semibold = TextStyle(
    color: AppColors.mainColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle main11semibold = TextStyle(
    color: AppColors.mainColor,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle main22semibold = TextStyle(
    color: AppColors.mainColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}
