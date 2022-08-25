import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style_manager.dart';
import 'values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

    // app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.blue,
        textStyle:
            getBoldStyle(color: ColorManager.white, fontSize: FontSize.s18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),

    // get text theme

    textTheme: TextTheme(


      titleMedium: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s22,
      ),
      titleLarge: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s22,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s10,
      ),

      bodyMedium: getBoldStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),

      bodyLarge: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s37,
      ),


    ),

    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,

      
      isDense: true,
      
      hintStyle: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
    
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),

      // enabled border style

      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.white),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),

      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.white),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),

      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1_5, color: ColorManager.error),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  
  );
}
