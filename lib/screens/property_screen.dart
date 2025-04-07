import 'package:flutter/material.dart';

import 'package:product_store/models/property_model.dart';
import 'package:product_store/providers/property_provider.dart';
import 'package:provider/provider.dart';


class PropertyScreen extends StatefulWidget 
{
  final Property property;

  const PropertyScreen({
    super.key,
    required this.property,
  });

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> 
{
  late final double screenHeight = MediaQuery.sizeOf(context).height;

  Widget _buildPropertyDetail(String title, String value, IconData icon) 
  {
    return Container(
      alignment: Alignment.center,
      height: 90,
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 11),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Theme.of(context).primaryColor.withAlpha((0.5*255).toInt()),
        //     blurRadius: 2,
        //     blurStyle: BlurStyle.outer
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            size: 42,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    final rooms = widget.property.rooms;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.black.withAlpha((0.3*255).toInt()),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          // Property Details
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Property Image
                  Image(
                    image: AssetImage(widget.property.image),
                    height: screenHeight * 0.45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 22),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Location
                        Text(
                          widget.property.location,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                          
                        // Area and Type
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withAlpha((0.1*255).toInt()),
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "${widget.property.area.toString()} sq ft   • ${widget.property.type}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                          
                        // Description
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.property.description,
                          style: TextStyle(
                            color: Colors.grey[400],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                          
                        // Property Details Grid
                        Text(
                          "Property Details",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                            // crossAxisCount: 2,
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            // mainAxisSpacing: 12,
                            // crossAxisSpacing: 12,
                            // childAspectRatio: 2.5,
                              children: [
                                _buildPropertyDetail(
                                  "Bedrooms",
                                  "${rooms['bedrooms']}",
                                  Icons.bed_outlined,
                                ),
                                _buildPropertyDetail(
                                  "Bathrooms",
                                  "${rooms['bathrooms']}",
                                  Icons.bathroom_outlined,
                                ),
                                _buildPropertyDetail(
                                  "Balconies",
                                  "${rooms['balconies']}",
                                  Icons.balcony_outlined,
                                ),
                                _buildPropertyDetail(
                                  "Parking",
                                  "${rooms['parking']}",
                                  Icons.garage_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Price Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              )
            ),
            child: Column(
              children: [
                Text(
                  "₹ ${widget.property.price} Cr",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PropertyProvider>().buyProperty(widget.property);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: const Color.fromARGB(234, 20, 20, 20),
                        content: Center(
                          child: Text(
                            "Purchase Sucessful!",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ));

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}