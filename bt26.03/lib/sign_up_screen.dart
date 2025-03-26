import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  String _gender = "male"; // default
  String _errorMessage = '';

  void _handleSignUp() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final error = auth.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      confirmPassword: _confirmPassController.text.trim(),
      dateOfBirth: _dobController.text.trim(),
      gender: _gender,
    );

    if (error == null) {
      // Thành công
      // Tự động đăng nhập user này, hoặc quay về màn hình Sign In
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Đăng ký thành công!")));
      Navigator.pop(context); // Quay lại SignIn
    } else {
      // Có lỗi
      setState(() {
        _errorMessage = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tương tự Sign In
      appBar: AppBar(title: Text("Sign Up"), backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Nhập email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Nhập password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Confirm Password
            TextField(
              controller: _confirmPassController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Nhập lại password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Date of birth
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: "Date of birth",
                hintText: "VD: 01/01/2000",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Radio male/female
            Row(
              children: [
                Text("Gender: "),
                SizedBox(width: 10),
                Radio(
                  value: "male",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
                Text("Male"),
                SizedBox(width: 10),
                Radio(
                  value: "female",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
                Text("Female"),
              ],
            ),
            // Hiển thị lỗi
            if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: TextStyle(color: Colors.red)),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _handleSignUp,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text("Sign Up", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
