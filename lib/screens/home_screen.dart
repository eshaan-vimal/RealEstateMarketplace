import 'package:flutter/material.dart';

import '../widgets/property_content.dart';
import './portfolio_content.dart';


class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>
{
  final List<Widget> _screens = [PropertyContent(), PortfolioContent()];
  late int selectedScreen;

  @override
  void initState()
  {
    super.initState();
    selectedScreen = 0;
  }

  @override
  void dispose()
  {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: _screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap:(value) {
          setState(() {
            selectedScreen = value;
          });
        },
        currentIndex: selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city_rounded, size: 30,),
            label: '',
          ),
        ]
      ),
    );
  }
}