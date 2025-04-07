class Property 
{
  final int? id;
  final String location;
  final String type;
  final int area;
  final double price;
  final String image;
  final String description;
  final Map<String, dynamic> rooms;
  final int age;
  final bool isSold;

  Property({
    this.id,
    required this.location,
    required this.type,
    required this.area,
    required this.price,
    required this.image,
    required this.description,
    required this.rooms,
    required this.age,
    this.isSold = false,
  });


  Map<String, dynamic> toMap() 
  {
    return {
      'id': id,
      'location': location,
      'type': type,
      'area': area,
      'price': price,
      'image': image,
      'description': description,
      'rooms': roomsToJson(rooms),
      'age': age,
      'isSold': isSold ? 1 : 0,
    };
  }


  static Property fromMap(Map<String, dynamic> map) 
  {
    return Property(
      id: map['id'],
      location: map['location'],
      type: map['type'],
      area: map['area'],
      price: map['price'],
      image: map['image'],
      description: map['description'],
      rooms: roomsFromJson(map['rooms']),
      age: map['age'],
      isSold: map['isSold'] == 1,
    );
  }


  static String roomsToJson(Map<String, dynamic> rooms) 
  {
    return '{"bedrooms": ${rooms["bedrooms"]}, "bathrooms": ${rooms["bathrooms"]}, "balconies": ${rooms["balconies"]}, "parking": ${rooms["parking"]}}';
  }


  static Map<String, dynamic> roomsFromJson(String roomsJson) 
  {
    final cleanJson = roomsJson.substring(1, roomsJson.length - 1);
    final parts = cleanJson.split(', ');
    
    final Map<String, dynamic> result = {};
    for (var part in parts) 
    {
      final keyValue = part.split(': ');
      final key = keyValue[0].replaceAll('"', '');
      final value = int.parse(keyValue[1]);
      result[key] = value;
    }
    
    return result;
  }


  Property copyWith({
    int? id,
    String? location,
    String? type,
    int? area,
    double? price,
    String? image,
    String? description,
    Map<String, dynamic>? rooms,
    int? age,
    bool? isSold,
  }) 
  {
    return Property(
      id: id ?? this.id,
      location: location ?? this.location,
      type: type ?? this.type,
      area: area ?? this.area,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      rooms: rooms ?? this.rooms,
      age: age ?? this.age,
      isSold: isSold ?? this.isSold,
    );
  }
}