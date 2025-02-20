import 'package:flutter/material.dart';
import '../property_data.dart' as data;


class PropertyProvider extends ChangeNotifier
{
  List<Map<String,dynamic>> properties = data.properties;
  late List<Map<String,dynamic>> filteredProperties = properties;
  final List<Map<String,dynamic>> portfolio = [];


  void filterProperty(String selectedFilter)
  {
    filteredProperties = selectedFilter == "All" ?
      properties : 
      properties.where((property) => property['type'] == selectedFilter).toList();
    notifyListeners();
  }

  void buyProperty(Map<String,dynamic> property)
  {
    if (!portfolio.contains(property))
    {
      portfolio.add(property);
      properties.remove(property);
      
      filteredProperties.remove(property);

      notifyListeners();
    }
  }

  void sellProperty(Map<String,dynamic> property)
  {
    if (portfolio.contains(property))
    {
      portfolio.remove(property);
      properties.add(property);
      
      if (property['type'] == filteredProperties[0]['type'])
      {
        filteredProperties.add(property);
      }

      notifyListeners();
    }
  }
}