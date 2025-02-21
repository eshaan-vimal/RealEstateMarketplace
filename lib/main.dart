import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:product_store/providers/property_provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => PropertyProvider(),
      child: MaterialApp(
        title: "Eminence",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF00FF9C), // Neon green
          primaryColorDark: const Color(0xFF005C3B),
          primaryColorLight: const Color(0xFF80FFD0),
          
          // Secondary colors
          secondaryHeaderColor: const Color.fromARGB(255, 255, 0, 127), // Neon pink
          
          // Background colors
          scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30), // Dark gray
          canvasColor: const Color.fromARGB(255, 30, 30, 30),
          
          // Card & Dialog colors
          cardColor: const Color.fromARGB(255, 40, 40, 40), // Slightly lighter gray
          dialogBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
          
          // Accent colors
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFF00FF9C), // Neon green
            // secondary: Color(0xFFFF00FF), // Neon pink
            secondary: const Color(0xFF00FF9C),
            tertiary: const Color(0xFF00F0FF), // Vibrant cyan
            surface: const Color.fromARGB(255, 45, 45, 45),
            error: const Color(0xFFFF0033), // Neon red
          ),
          
          // Text themes
          textTheme: const TextTheme(
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
            bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
            bodyMedium: TextStyle(color: Color(0xFFE0E0E0)),
          ),
          
          // Input decoration
          inputDecorationTheme: const InputDecorationTheme(
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
            // elevation: 1,
            backgroundColor: const Color.fromARGB(255, 15, 15, 15).withAlpha((0.85*255).toInt()),
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xFFE0E0E0),
            ),
            shadowColor: const Color(0xFF00FF9C),
          ),
          
          // Button themes
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00FF9C),
              foregroundColor: const Color.fromARGB(255, 12, 12, 12),// Dark gray text on buttons
            ),
          ),
          
          // Icon themes
          iconTheme: const IconThemeData(
            color: Color(0xFF00FF9C),
          ),
          
          // Divider color
          dividerColor: const Color(0xFF00FF9C),
          
          fontFamily: "Lato",
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}