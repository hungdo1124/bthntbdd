import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'sign_in_screen.dart';
import 'explorer_screen.dart';
import 'account_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => AuthProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Workflow',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/explorer': (context) => ExplorerScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}
