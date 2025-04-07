import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:product_store/property_data.dart';

import 'package:product_store/models/property_model.dart';
import 'package:product_store/providers/property_provider.dart';
import '../widgets/property_card.dart';
import './property_screen.dart';


class PropertyContent extends StatefulWidget 
{
  const PropertyContent({super.key});

  @override
  State<PropertyContent> createState() => _PropertyContentState();
}

class _PropertyContentState extends State<PropertyContent> 
{
  late List<Property> properties;
  final List<String> filters = ['All', 'Villa', '3BHK', '2BHK', '1BHK'];
  late String selectedFilter = filters[0];
  late List<Property> filteredProperties;


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
    // properties = context.watch<PropertyProvider>().properties;

    return SafeArea(
      child: Column(
        children: [
      
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Real\nEstate",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 24.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w200,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
      
          SizedBox(
            height: 75,
            child: Consumer<PropertyProvider>(
              builder: (context, propertyProvider, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final bool isSelected = selectedFilter == filters[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index];
                          });
                        },
                        child: Chip(
                          backgroundColor: isSelected? Theme.of(context).colorScheme.primary : null,
                          label: Text(
                            filters[index],
                          ),
                          labelStyle: isSelected? const TextStyle(color: Colors.black, fontWeight: FontWeight.bold) : null,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          side: const BorderSide(
                            // color: Theme.of(context).colorScheme.primary,
                            color: Colors.black,
                            width: 0,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
          const SizedBox(height: 10,),
      
          Consumer<PropertyProvider>(
            builder: (context, propertyProvider, child) {
              
              filteredProperties = selectedFilter == "All" ?
                propertyProvider.properties : 
                propertyProvider.properties.where((property) => property.type == selectedFilter).toList();

              return Expanded(
                child: filteredProperties.isEmpty?
                Center(
                  child: Text(
                    "No listings available.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 22,
                    ),
                  ),
                ) :
                ListView.builder(
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PropertyScreen(property: filteredProperties[index]),
                          ),
                        );
                        setState(() {
                        });
                      },
                      child: PropertyCard(
                        image: filteredProperties[index].image,
                        price: filteredProperties[index].price, 
                        location: filteredProperties[index].location, 
                        area: filteredProperties[index].area, 
                        type: filteredProperties[index].type,
                      ),
                    );
                  }
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}