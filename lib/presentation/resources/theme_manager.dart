import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';
import 'font_style_manager.dart';

ThemeData getAppThemeData() {
  return ThemeData(
    //main color of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryWithOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    //secondary color

    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    //rippel color
    splashColor: ColorManager.primaryWithOpacity70,
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    //app bar theme
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightGrey,
      centerTitle: true,
      titleTextStyle:
          getRegular(fontSize: FontSize.s12, fontColor: ColorManager.white),
    ),
    //Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryWithOpacity70),

    //eleveted Button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegular(
          fontSize: FontSize.s12,
          fontColor: ColorManager.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),

    //text theme

    textTheme: TextTheme(
      headline1: getBold(
          fontSize: FontSize.s16, fontColor: ColorManager.darkGrey), //H1
      headline2:
          getSemiBold(fontSize: FontSize.s12, fontColor: ColorManager.darkGrey),
      subtitle1:
          getMedium(fontSize: FontSize.s14, fontColor: ColorManager.grey), //p
      caption: getRegular(fontSize: FontSize.s17, fontColor: ColorManager.grey),
      bodyText1:
          getRegular(fontSize: FontSize.s12, fontColor: ColorManager.grey), //p
    ),
    //inputdecoration theme(text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      hintStyle:
          getRegular(fontSize: FontSize.s12, fontColor: ColorManager.lightGrey),
      labelStyle:
          getMedium(fontSize: FontSize.s12, fontColor: ColorManager.darkGrey),
      errorStyle:
          getRegular(fontSize: FontSize.s12, fontColor: ColorManager.red),

      //enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),

      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),

      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),

      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),
    ),
  );
}
