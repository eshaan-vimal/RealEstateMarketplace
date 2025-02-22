import 'package:flutter/material.dart';
import '../property_data.dart' as data;


class PropertyProvider extends ChangeNotifier
{
  List<Map<String,dynamic>> properties = data.properties;
  final List<Map<String,dynamic>> portfolio = [];


  void buyProperty(Map<String,dynamic> property)
  {
    if (!portfolio.contains(property))
    {
      portfolio.add(property);
      properties.remove(property);

      notifyListeners();
    }
  }

  void sellProperty(Map<String,dynamic> property)
  {
    if (portfolio.contains(property))
    {
      portfolio.remove(property);
      properties.add(property);

      notifyListeners();
    }
  }
}