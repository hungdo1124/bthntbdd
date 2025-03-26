import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'sign_up_screen.dart';
import 'explorer_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _handleSignIn() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    bool success = auth.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (success) {
      Navigator.pushReplacementNamed(context, '/explorer');
    } else {
      setState(() {
        _errorMessage = 'Email hoặc mật khẩu không đúng!';
      });
    }
  }

  void _handleGoogleSignIn() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    bool success = auth.signInWithGoogle();
    if (success) {
      Navigator.pushReplacementNamed(context, '/explorer');
    }
  }

  void _handleFacebookSignIn() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    bool success = auth.signInWithFacebook();
    if (success) {
      Navigator.pushReplacementNamed(context, '/explorer');
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _handleForgotPassword() {
    // Thực hiện hành động quên mật khẩu, ví dụ: hiển thị dialog hoặc chuyển sang màn hình reset password
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Chức năng quên mật khẩu chưa được triển khai!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Giao diện Sign In
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Text("Email ID", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email here!",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              // TextField cho password mà không dùng suffixIcon
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password here!",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              // Button Forgot password bên dưới TextField password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _handleForgotPassword,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty) ...[
                SizedBox(height: 10),
                Text(_errorMessage, style: TextStyle(color: Colors.red)),
              ],
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text("Sign In", style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 20),

              // or sign in with
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Or sign in with"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 20),

              // Google & Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _handleGoogleSignIn,
                    icon: Icon(Icons.g_mobiledata, size: 24),
                    label: Text("Google"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _handleFacebookSignIn,
                    icon: Icon(Icons.facebook),
                    label: Text("Facebook"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4267B2),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Not yet a member? Sign Up
              Center(
                child: Wrap(
                  children: [
                    Text("Not yet a member? "),
                    GestureDetector(
                      onTap: _navigateToSignUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
