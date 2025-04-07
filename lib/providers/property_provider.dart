import 'package:flutter/material.dart';
import 'package:product_store/repos/property_repo.dart';
import 'package:product_store/models/property_model.dart'; // Make sure to import your Property model

class PropertyProvider extends ChangeNotifier 
{
  final PropertyRepository propertyRepo = PropertyRepository();
  
  List<Property> _properties = [];
  List<Property> _portfolio = [];
  bool _isLoading = true;

  List<Property> get properties => _properties;
  List<Property> get portfolio => _portfolio;
  bool get isLoading => _isLoading;


  PropertyProvider() 
  {
    _initializeData();
  }


  Future<void> _initializeData() async 
  {
    _isLoading = true;
    notifyListeners();

    try 
    {
      final allProperties = await propertyRepo.getAllProperties();
      
      _properties = allProperties.where((p) => !p.isSold).toList();
      _portfolio = allProperties.where((p) => p.isSold).toList();
    } 
    catch (e) 
    {
      debugPrint('Error loading properties: $e');
      _properties = [];
      _portfolio = [];
    } 
    finally 
    {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> refreshProperties() async 
  {
    await _initializeData();
  }


  Future<void> buyProperty(Property property) async 
  {
    try 
    {
      final updatedProperty = property.copyWith(isSold: true);
      await propertyRepo.updateProperty(updatedProperty);
      
      _properties.removeWhere((p) => p.id == property.id);
      _portfolio.add(updatedProperty);
      
      notifyListeners();
    } 
    catch (e) 
    {
      debugPrint('Error buying property: $e');
    }
  }


  Future<void> sellProperty(Property property) async 
  {
    try 
    {
      final updatedProperty = property.copyWith(isSold: false);
      await propertyRepo.updateProperty(updatedProperty);
      
      _portfolio.removeWhere((p) => p.id == property.id);
      _properties.add(updatedProperty);
      
      notifyListeners();
    } 
    catch (e) 
    {
      debugPrint('Error selling property: $e');
    }
  }


  Future<void> addProperty(Property property) async {
    try 
    {
      final id = await propertyRepo.insertProperty(property);
      
      final newProperty = property.copyWith(id: id);
      _properties.add(newProperty);
      
      notifyListeners();
    } 
    catch (e) 
    {
      debugPrint('Error adding property: $e');
    }
  }


  Future<void> deleteProperty(Property property) async {
    try 
    {
      await propertyRepo.deleteProperty(property.id!);
      
      _properties.removeWhere((p) => p.id == property.id);
      _portfolio.removeWhere((p) => p.id == property.id);
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting property: $e');
    }
  }
}