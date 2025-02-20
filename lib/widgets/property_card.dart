import 'package:flutter/material.dart';


class PropertyCard extends StatelessWidget
{
  final String location;
  final String type;
  final String image;
  final double price;
  final int area;

  const PropertyCard({
    super.key,
    required this.image,
    required this.price,
    required this.location,
    required this.area,
    required this.type,
  });


  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          // Property Details
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price
                Text(
                  '₹ $price Cr',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                
                // Location and Type Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Location
                    Icon(Icons.location_on_outlined,size: 20,),
                    SizedBox(width: 5,),

                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 16),
                    // Type
                    Column(
                      children: [
                        // Area (smaller text)
                        Text(
                          '$area sq.ft',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          type,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ]
                    ),
                  ],
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}