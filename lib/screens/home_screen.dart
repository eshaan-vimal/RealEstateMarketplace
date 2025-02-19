import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState()
  {
    super.initState();
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
      appBar: AppBar(
        title: Text(
          "Product Store",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}