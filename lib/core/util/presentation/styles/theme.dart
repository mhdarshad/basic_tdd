import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

class DynamicThemeControle{
  Color cloudMe = Color(0xFFF76BF43);

  ThemeCollection get theme =>themeCollection();
  late ElevatedButtonThemeData _elevatedButtonTheme;
  DynamicThemeControle(){
    elevatedButtonTheme = ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey[200],
          backgroundColor: /*Global.placeOrderDisableFlag == true ? Colors.grey :*/ Colors.white,
          minimumSize: const Size(100, 36),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ));
  }
  themeCollection() => ThemeCollection(
    themes: {
      0: ThemeData(
          primarySwatch: PrimerySwatchThemeData,
          backgroundColor: const Color(0xFF2D2D2D),
          scaffoldBackgroundColor: const Color(0xFF2D2D2D),
          popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF2D2D2D)),
          fontFamily: 'Roboto',
          chipTheme: ChipThemeData(checkmarkColor: Colors.green,selectedColor: cloudMe,disabledColor: Colors.black38,backgroundColor: Colors.black38),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.white,fontSize: 20,),
            bodyText1: TextStyle(color: Colors.grey,),
          ),
          dialogTheme: const DialogTheme(backgroundColor:Color(0xFF333632) ,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2D2D2D),titleTextStyle: TextStyle(color: Colors.grey)),
          cardColor: const Color(0xFF333632),
          cardTheme: const CardTheme(color: Colors.black54,
            elevation: 3,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),),
          iconTheme: IconThemeData(color: cloudMe),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle:  TextStyle(color: Colors.white38),
              fillColor: Color(0xFF333632)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white38),
                foregroundColor: Colors.grey,
                backgroundColor:/* Global.placeOrderDisableFlag == true ? Colors.grey : */ const Color(
                    0xFF333632),
                minimumSize: Size(100, 36),
                padding: EdgeInsets.symmetric(horizontal: 8),
              ))/*cardColor: ,backgroundColor: ,textTheme:*/),

      1: ThemeData(
          primarySwatch: const MaterialColor(0xFFF1F5EE, {
            50:Color(0xFF2D2D2D),
            200:Color(0xFF2D2D2D),
            100:Color(0xFF2D2D2D),
            500:Color(0xFF2D2D2D),
            600:Color(0xFF2D2D2D),
            700:Color(0xFF2D2D2D),
          }),
          scaffoldBackgroundColor:  const Color(0xFFF7F8F6),
          fontFamily: 'Roboto',
          chipTheme: ChipThemeData(checkmarkColor: Colors.green,selectedColor: cloudMe,disabledColor: Colors.black87,backgroundColor: Colors.white),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.black87,fontSize: 20,),
            bodyText1: TextStyle(color: Colors.black87,),
          ),
          cardTheme: const CardTheme(color: Colors.white,
            elevation: 3,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),),
          dialogTheme: const DialogTheme(backgroundColor:Color(0xFFD9EFDB) ,titleTextStyle: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFD9EFDB),titleTextStyle: TextStyle(color: Colors.black87)),
          cardColor: const Color(0xFFF7F8F6),
          backgroundColor: const Color(0xFFF7F8F6),
          iconTheme: IconThemeData(color: cloudMe),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle:  TextStyle(color: Colors.black87),
              fillColor: Color(0xFFEFF8EE)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.black87),
                foregroundColor: Colors.white,
                backgroundColor: /*Global.placeOrderDisableFlag == true ? Colors.white : */ const Color(
                    0xFFF7FCF6),
                minimumSize: const Size(100, 36),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ))/*cardColor: ,backgroundColor: ,textTheme:*/),

      2: ThemeData(
          primarySwatch: const MaterialColor(0xFFF1F5EE, {
            50:Color(0xFF2D2D2D),
            200:Color(0xFF2D2D2D),
            100:Color(0xFF2D2D2D),
            500:Color(0xFF2D2D2D),
            600:Color(0xFF2D2D2D),
            700:Color(0xFF2D2D2D),
          }),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto',
          chipTheme: ChipThemeData(checkmarkColor: Colors.green,selectedColor: cloudMe,disabledColor: Colors.black87,backgroundColor: Colors.white),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.black87,fontSize: 20,),
            bodyText1: TextStyle(color: Colors.black87,),
          ),
          dialogTheme: const DialogTheme(backgroundColor:Color(0xFFF7FDF7) ,titleTextStyle: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFFFFF),titleTextStyle: TextStyle(color: Colors.black87)),
          cardColor: const Color(0xFFF5F8F3),
          backgroundColor: const Color(0xFFEDF5EE),
          iconTheme: IconThemeData(color: cloudMe),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle:  TextStyle(color: Colors.black87),
              fillColor: Color(0xFFE3EFDF)
          ),
          buttonTheme: const ButtonThemeData(buttonColor: Colors.green,textTheme: ButtonTextTheme.primary),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.black87),
                foregroundColor: Colors.white,
                backgroundColor: /*Global.placeOrderDisableFlag == true ? Colors.white : */ const Color(
                    0xFFE9F6E5),
                minimumSize: const Size(100, 36),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ))/*cardColor: ,backgroundColor: ,textTheme:*/),
      3: ThemeData.dark(),
    },
    fallbackTheme: ThemeData.light(), // optional fallback theme, default value is ThemeData.light()
  );

  MaterialColor get PrimerySwatchThemeData {
    return const MaterialColor(0xFFF1F5EE, {
          50:Color(0xFF2D2D2D),
          200:Color(0xFF2D2D2D),
          100:Color(0xFF2D2D2D),
          500:Color(0xFF2D2D2D),
          600:Color(0xFF2D2D2D),
          700:Color(0xFF2D2D2D),
        });
  }
  set elevatedButtonTheme(ElevatedButtonThemeData data)=>_elevatedButtonTheme =data;
}
final dynamicTheme = DynamicThemeControle();