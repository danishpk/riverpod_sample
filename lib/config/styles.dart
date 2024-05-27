
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: ColorConstants.primaryColor,
        secondary: ColorConstants.secondaryColor,
      ),
      primaryColor: ColorConstants.primaryColor,
      appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorConstants.primaryColor,
        textTheme: ButtonTextTheme.normal,
      ));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: ColorConstants.primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorConstants.primaryColor),
    systemOverlayStyle: SystemUiOverlayStyle.dark
  );
}