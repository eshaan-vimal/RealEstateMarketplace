import 'package:flutter/material.dart';

import './screens/home_screen.dart';


void main()
{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: "Product Store",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF00FF9C), // Neon green
        primaryColorDark: Color(0xFF005C3B),
        primaryColorLight: Color(0xFF80FFD0),
        
        // Secondary colors
        secondaryHeaderColor: Color(0xFFFF00FF), // Neon pink
        
        // Background colors
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30), // Dark gray
        canvasColor: Color.fromARGB(255, 30, 30, 30),
        
        // Card & Dialog colors
        cardColor: Color.fromARGB(255, 40, 40, 40), // Slightly lighter gray
        dialogBackgroundColor: Color.fromARGB(255, 40, 40, 40),
        
        // Accent colors
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF00FF9C), // Neon green
          secondary: Color(0xFFFF00FF), // Neon pink
          tertiary: Color(0xFF00F0FF), // Vibrant cyan
          surface: Color.fromARGB(255, 45, 45, 45),
          error: Color(0xFFFF0033), // Neon red
        ),
        
        // Text themes
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFE0E0E0),
            fontSize: 38,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
          displayMedium: TextStyle(
            color: Color(0xFF00FF9C),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(color: Color(0xFF00FF9C)),
          bodyMedium: TextStyle(color: Color(0xFF00FF9C)),
        ),
        
        // Input decoration
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Color(0xFF00FF9C),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00FF9C)),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 16, 255, 163), width: 2),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00FF9C)),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
        ),

        chipTheme: ChipThemeData(
          backgroundColor: Color.fromARGB(255, 23, 23, 23),
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF00FF9C),
          ),
        ),
        
        // Button themes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00FF9C),
            foregroundColor: Color(0xFF202020), // Dark gray text on buttons
          ),
        ),
        
        // Icon themes
        iconTheme: IconThemeData(
          color: Color(0xFF00FF9C),
        ),
        
        // Divider color
        dividerColor: Color(0xFF00FF9C),
        
        fontFamily: "Lato",
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}