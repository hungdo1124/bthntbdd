// import 'package:flutter/material.dart';

// class ScanScreen extends StatefulWidget {
//   const ScanScreen({Key? key}) : super(key: key);

//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _positionAnim;   // Dành cho vị trí thanh quét
//   late Animation<double> _fadeAnim;       // Dành cho hiệu ứng mờ dần

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     // Thanh quét chạy từ top=80 đến top=320
//     _positionAnim = Tween<double>(begin: 80, end: 320).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     // Thanh quét mờ dần (opacity 0.3 -> 1.0)
//     _fadeAnim = Tween<double>(begin: 0.3, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Màu nền be nhẹ, tương phản với ảnh chai
//       backgroundColor: const Color(0xFFF7F2ED),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Nút Back ở góc trên trái
//             Positioned(
//               top: 10,
//               left: 10,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),

//             // Chai nước ép + góc quét
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Ảnh chai nước ép
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.asset(
//                       'assets/juice.png', // Thay bằng ảnh thật
//                       width: 220,
//                       height: 420,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   // 4 góc quét - CustomPaint
//                   // Để bo viền trắng ở 4 góc, không fill nền
//                   CustomPaint(
//                     size: const Size(250, 450), // Vùng quét to hơn ảnh 1 chút
//                     painter: CornerPainter(
//                       cornerSize: 40,
//                       strokeWidth: 4,
//                       color: Colors.white,
//                     ),
//                   ),

//                   // Thanh quét animation
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       return Positioned(
//                         top: _positionAnim.value,
//                         child: FadeTransition(
//                           opacity: _fadeAnim,
//                           child: Container(
//                             width: 220,
//                             height: 6,
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                                 colors: [
//                                   Colors.white60,
//                                   Colors.white,
//                                   Colors.white60,
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             // Thông tin sản phẩm + nút Add ở dưới cùng
//             Positioned(
//               left: 20,
//               right: 20,
//               bottom: 30,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(24),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     // Thông tin "Lauren's Orange Juice"
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text("Phuong Anh’s",
//                               style: TextStyle(fontSize: 14, color: Colors.grey)),
//                           SizedBox(height: 2),
//                           Text("Orange Juice",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                         ],
//                       ),
//                     ),
//                     // Nút Add (+)
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Icon(Icons.add, color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ------------------------------------------------------------------------
// // 2. Custom Painter để vẽ 4 góc quét trắng
// // ------------------------------------------------------------------------
// class CornerPainter extends CustomPainter {
//   final double cornerSize;
//   final double strokeWidth;
//   final Color color;
//   final double borderRadius; // Bo góc

//   CornerPainter({
//     required this.cornerSize,
//     required this.strokeWidth,
//     required this.color,
//     this.borderRadius = 20, // Đảm bảo đồng bộ bo góc
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round; // 🔥 Fix lỗi góc bị cắt

//     final double r = borderRadius; // Bo góc

//     // Góc trên trái
//     canvas.drawLine(Offset(0, r), Offset(0, cornerSize), paint);
//     canvas.drawLine(Offset(r, 0), Offset(cornerSize, 0), paint);
//     canvas.drawArc(Rect.fromLTWH(0, 0, 2 * r, 2 * r), 3.14, 1.5, false, paint);

//     // Góc trên phải
//     canvas.drawLine(Offset(size.width, r), Offset(size.width, cornerSize), paint);
//     canvas.drawLine(Offset(size.width - r, 0), Offset(size.width - cornerSize, 0), paint);
//     canvas.drawArc(Rect.fromLTWH(size.width - 2 * r, 0, 2 * r, 2 * r), 4.71, 1.5, false, paint);

//     // Góc dưới trái
//     canvas.drawLine(Offset(0, size.height - r), Offset(0, size.height - cornerSize), paint);
//     canvas.drawLine(Offset(r, size.height), Offset(cornerSize, size.height), paint);
//     canvas.drawArc(Rect.fromLTWH(0, size.height - 2 * r, 2 * r, 2 * r), 1.57, 1.5, false, paint);

//     // Góc dưới phải
//     canvas.drawLine(Offset(size.width, size.height - r), Offset(size.width, size.height - cornerSize), paint);
//     canvas.drawLine(Offset(size.width - r, size.height), Offset(size.width - cornerSize, size.height), paint);
//     canvas.drawArc(Rect.fromLTWH(size.width - 2 * r, size.height - 2 * r, 2 * r, 2 * r), 0, 1.5, false, paint);
//   }

//   @override
//   bool shouldRepaint(CornerPainter oldDelegate) {
//     return oldDelegate.cornerSize != cornerSize ||
//         oldDelegate.strokeWidth != strokeWidth ||
//         oldDelegate.color != color ||
//         oldDelegate.borderRadius != borderRadius;
//   }
// }
