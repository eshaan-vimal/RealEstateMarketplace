import 'package:flutter/material.dart';
import 'package:product_store/property_data.dart';


class PortfolioContent extends StatefulWidget 
{
  const PortfolioContent({super.key});

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> 
{
  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "My Portfolio",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(height: 16,),

          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(14.0),

                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      cart[index]['image'],
                    ),
                    radius: 32,
                  ),

                  title: Text(
                    cart[index]['location'],
                  ),

                  subtitle: Text(
                    "${cart[index]['area']} sq ft.  ${cart[index]['type']}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  trailing: ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "Sell",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      )
    );
  }
}