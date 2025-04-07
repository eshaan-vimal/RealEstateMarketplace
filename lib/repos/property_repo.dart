import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:product_store/models/property_model.dart';


class PropertyRepository 
{
  static final PropertyRepository _instance = PropertyRepository._init();
  static Database? _database;

  PropertyRepository._init();

  factory PropertyRepository() => _instance;

  Future<Database> get database async 
  {
    if (_database != null) return _database!;

    _database = await _initDB('properties.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async 
  {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async 
  {
    await db.execute('''
      CREATE TABLE properties(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        location TEXT NOT NULL,
        type TEXT NOT NULL,
        area INTEGER NOT NULL,
        price REAL NOT NULL,
        image TEXT NOT NULL,
        description TEXT NOT NULL,
        rooms TEXT NOT NULL,
        age INTEGER NOT NULL,
        isSold INTEGER NOT NULL
      )
    ''');

    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async 
  {
    final initialProperties = [
      {
        "location": "Hiranandani Estate, Thane West",
        "type": "Villa",
        "area": 3000,
        "price": 6.5,
        "image": "assets/images/p1.png",
        "description": "Spacious 4BHK villa with private garden and modern interiors.",
        "rooms": Property.roomsToJson({"bedrooms": 4, "bathrooms": 4, "balconies": 2, "parking": 2}),
        "age": 5,
        "isSold": 0
      },
      {
        "location": "Majiwada, Thane",
        "type": "3BHK",
        "area": 1300,
        "price": 2.2,
        "image": "assets/images/p2.png",
        "description": "Modern 3BHK apartment with modular kitchen and city view.",
        "rooms": Property.roomsToJson({"bedrooms": 3, "bathrooms": 3, "balconies": 1, "parking": 1}),
        "age": 3,
        "isSold": 0
      },
      {
        "location": "Kasarvadavali, Thane West",
        "type": "2BHK",
        "area": 950,
        "price": 1.15,
        "image": "assets/images/p3.png",
        "description": "Well-lit 2BHK with semi-furnished interiors and kids' play area.",
        "rooms": Property.roomsToJson({"bedrooms": 2, "bathrooms": 2, "balconies": 1, "parking": 1}),
        "age": 7,
        "isSold": 0
      },
      {
        "location": "Ghodbunder Road, Thane",
        "type": "1BHK",
        "area": 450,
        "price": 0.55,
        "image": "assets/images/p4.png",
        "description": "Compact 1BHK, ideal for singles or couples, with easy access to transport.",
        "rooms": Property.roomsToJson({"bedrooms": 1, "bathrooms": 1, "balconies": 0, "parking": 0}),
        "age": 10,
        "isSold": 0
      },
      {
        "location": "Brahmand, Thane West",
        "type": "Villa",
        "area": 3500,
        "price": 5.8,
        "image": "assets/images/p5.png",
        "description": "Luxurious 5BHK villa with private terrace and spacious backyard.",
        "rooms": Property.roomsToJson({"bedrooms": 5, "bathrooms": 5, "balconies": 3, "parking": 3}),
        "age": 4,
        "isSold": 0
      },
      {
        "location": "Vartak Nagar, Thane",
        "type": "3BHK",
        "area": 1250,
        "price": 1.9,
        "image": "assets/images/p6.png",
        "description": "Newly constructed 3BHK with premium fittings and club access.",
        "rooms": Property.roomsToJson({"bedrooms": 3, "bathrooms": 2, "balconies": 1, "parking": 1}),
        "age": 2,
        "isSold": 0
      },
      {
        "location": "Kolshet Road, Thane",
        "type": "2BHK",
        "area": 860,
        "price": 1.05,
        "image": "assets/images/p7.png",
        "description": "Affordable 2BHK in a gated society with garden and gym facilities.",
        "rooms": Property.roomsToJson({"bedrooms": 2, "bathrooms": 2, "balconies": 1, "parking": 1}),
        "age": 6,
        "isSold": 0
      },
    ];

    for (var property in initialProperties) 
    {
      await db.insert('properties', property);
    }
  }


  Future<List<Property>> getAllProperties() async 
  {
    final db = await database;
    final propertiesMap = await db.query('properties');
    
    return propertiesMap.map((map) => Property.fromMap(map)).toList();
  }


  Future<Property?> getPropertyById(int id) async 
  {
    final db = await database;
    final maps = await db.query(
      'properties',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) 
    {
      return Property.fromMap(maps.first);
    }
    return null;
  }

  Future<int> insertProperty(Property property) async 
  {
    final db = await database;
    return await db.insert('properties', property.toMap());
  }


  Future<int> updateProperty(Property property) async 
  {
    final db = await database;
    return await db.update(
      'properties',
      property.toMap(),
      where: 'id = ?',
      whereArgs: [property.id],
    );
  }


  Future<int> deleteProperty(int id) async 
  {
    final db = await database;
    return await db.delete(
      'properties',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  Future<int> togglePropertySoldStatus(int id) async 
  {
    final property = await getPropertyById(id);
    
    if (property != null) 
    {
      final updatedProperty = property.copyWith(isSold: !property.isSold);
      return await updateProperty(updatedProperty);
    }
    
    return 0;
  }


  Future<List<Property>> getAvailableProperties() async 
  {
    final db = await database;
    final propertiesMap = await db.query(
      'properties',
      where: 'isSold = ?',
      whereArgs: [0],
    );
    
    return propertiesMap.map((map) => Property.fromMap(map)).toList();
  }


  Future<List<Property>> getSoldProperties() async 
  {
    final db = await database;
    final propertiesMap = await db.query(
      'properties',
      where: 'isSold = ?',
      whereArgs: [1],
    );
    
    return propertiesMap.map((map) => Property.fromMap(map)).toList();
  }


  Future close() async 
  {
    final db = await database;
    db.close();
  }
}