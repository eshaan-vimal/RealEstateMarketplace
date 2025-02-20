import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/property_provider.dart';


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
    final List<Map<String,dynamic>> portfolio = context.watch<PropertyProvider>().portfolio;

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
            child: portfolio.isEmpty?
            Center(
              child: Text(
                "No assets acquired.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 22,
                ),
              ),
            ) :
            ListView.builder(
              itemCount: portfolio.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(14.0),

                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      portfolio[index]['image'],
                    ),
                    radius: 32,
                  ),

                  title: Text(
                    portfolio[index]['location'],
                  ),

                  subtitle: Text(
                    "${portfolio[index]['area']} sq ft.  ${portfolio[index]['type']}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  trailing: ElevatedButton(
                    onPressed: () {
                      context.read<PropertyProvider>().sellProperty(portfolio[index]);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color.fromARGB(234, 20, 20, 20),
                        content: Center(
                          child: Text(
                            "Sale Successful!",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ));
                    }, 
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