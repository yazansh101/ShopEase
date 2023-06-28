import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('How do I create an account?'),
                  onTap: () {
                    // Logic to navigate to help article for creating an account
                  },
                  iconColor: primaryColor,
          
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('How do I reset my password?'),
                  onTap: () {
                    // Logic to navigate to help article for resetting password
                  },
                  iconColor: primaryColor,
                ),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('How do I set up payment methods?'),
                  onTap: () {
                    // Logic to navigate to help article for setting up payment methods
                  },
                  iconColor: primaryColor,
          
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('How do I place an order?'),
                  onTap: () {
                    // Logic to navigate to help article for placing an order
                  },
                  iconColor: primaryColor,
          
                ),
                // Add more help articles as needed
              ],
            ),
          ),
          const Spacer(),
        
        ],
      ),
    );
  }
}
