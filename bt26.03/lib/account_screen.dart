import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  void _signOut(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    auth.logout();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: const Color.fromARGB(255, 222, 194, 7),
            width: double.infinity,
          ),
          SizedBox(height: 20),
          Text(
            "John Liu",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("Food Reviewer", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "I have above 5 years of experience in tasting food around the world, now I am learning how to cook",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => _signOut(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: Text("Sign Out"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Account tab
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/explorer',
              (route) => false,
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorer"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
