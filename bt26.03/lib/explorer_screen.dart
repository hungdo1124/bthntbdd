import 'package:flutter/material.dart';

class ExplorerScreen extends StatefulWidget {
  @override
  _ExplorerScreenState createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    ExplorerContent(),
    // Giả lập trang cart
    Center(child: Text("Cart Screen")),
    // Account placeholder (thực tế ta push sang /account)
    Center(child: Text("Account placeholder")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      // Chuyển sang màn hình Account
      Navigator.pushNamed(context, '/account');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
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

// Nội dung Explorer
class ExplorerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explorer"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for meals or area",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // Top Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Top Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list, color: Colors.orange),
                  SizedBox(width: 8),
                  Text("Filter", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Danh sách ngang: Pizza, Burgers, Steak
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(
                    "Pizza",
                    "https://images.pexels.com/photos/2619967/pexels-photo-2619967.jpeg",
                  ),
                  _buildCategoryItem(
                    "Burgers",
                    "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg",
                  ),
                  _buildCategoryItem(
                    "Steak",
                    "https://images.pexels.com/photos/299348/pexels-photo-299348.jpeg",
                  ),
                ],
              ),
            ),

            // Popular Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Popular Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("View all", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),

            // Danh sách ngang
            Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPopularItem(
                    "Food 1",
                    "By Viet Nam",
                    "\$1",
                    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
                  ),
                  _buildPopularItem(
                    "Food 2",
                    "By Viet Nam",
                    "\$3",
                    "https://images.pexels.com/photos/1640775/pexels-photo-1640775.jpeg",
                  ),
                ],
              ),
            ),

            // Thêm list "Popular Items" lần 2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Popular Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("View all", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
            Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPopularItem(
                    "Food 3",
                    "By Viet Nam",
                    "\$5",
                    "https://images.pexels.com/photos/357743/pexels-photo-357743.jpeg",
                  ),
                  _buildPopularItem(
                    "Food 4",
                    "By Viet Nam",
                    "10% OFF",
                    "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imageUrl) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPopularItem(
    String name,
    String origin,
    String price,
    String imageUrl,
  ) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(origin, style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text(price, style: TextStyle(color: Colors.orange, fontSize: 14)),
        ],
      ),
    );
  }
}
