// import 'package:flutter/material.dart';
// import 'scan_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     _HomeContent(),
//     Center(child: Text("Notifications", style: TextStyle(fontSize: 24))),
//     Container(), // Tab Scan sẽ push sang ScanScreen
//     Center(child: Text("History", style: TextStyle(fontSize: 24))),
//     Center(child: Text("Cart", style: TextStyle(fontSize: 24))),
//   ];

//   void _onItemTapped(int index) {
//     if (index == 2) {
//       // Khi nhấn icon Scan ở bottom bar
//       Navigator.push(context, MaterialPageRoute(builder: (context) => ScanScreen()));
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Notifications"),
//           BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: "Scan"),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
//           BottomNavigationBarItem(
//             icon: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFEFE6),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(Icons.shopping_cart, color: Colors.orange),
//             ),
//             label: "Cart",
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _HomeContent extends StatelessWidget {
//   const _HomeContent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hello 👋",
//                 style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
//             Text("Phuong Anh", style: TextStyle(color: Colors.black54, fontSize: 16)),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(
//               backgroundImage: AssetImage("assets/avatar.jpg"), // Thay bằng ảnh của bạn
//               radius: 20,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Text("Your Insights", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 15),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 1.1,
//                 children: [
//                   _buildFeatureBox(
//                     title: "Scan new",
//                     icon: Icons.qr_code_scanner,
//                     color: Colors.blue.shade100,
//                     subTitle: "Scanned 483",
//                     onTap: () {
//                       // Khi nhấn "Scan new", cũng chuyển sang ScanScreen
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => ScanScreen()));
//                     },
//                   ),
//                   _buildFeatureBox(
//                     title: "Counterfeits",
//                     icon: Icons.warning,
//                     color: Colors.orange.shade100,
//                     subTitle: "Counterfeited 32",
//                     onTap: () {},
//                   ),
//                   _buildFeatureBox(
//                     title: "Success",
//                     icon: Icons.check_circle,
//                     color: Colors.green.shade100,
//                     subTitle: "Checkouts 8",
//                     onTap: () {},
//                   ),
//                   _buildFeatureBox(
//                     title: "Directory",
//                     icon: Icons.folder,
//                     color: Colors.blue.shade100,
//                     subTitle: "History 26",
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Text("Explore More",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 Spacer(),
//                 Icon(Icons.arrow_forward, size: 20),
//               ],
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureBox({
//     required String title,
//     required IconData icon,
//     required Color color,
//     required String subTitle,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: Colors.black),
//             SizedBox(height: 10),
//             Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 4),
//             Text(subTitle, style: TextStyle(fontSize: 12, color: Colors.black54)),
//           ],
//         ),
//       ),
//     );
//   }
// }
