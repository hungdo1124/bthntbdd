import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String password;
  final String dateOfBirth;
  final String gender;

  UserModel({
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.gender,
  });
}

class AuthProvider with ChangeNotifier {
  // Danh sách user đã đăng ký (email -> UserModel)
  final Map<String, UserModel> _users = {};

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // Đăng nhập (email, password)
  bool login(String email, String password) {
    if (_users.containsKey(email)) {
      final user = _users[email]!;
      if (user.password == password) {
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  // Đăng xuất
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  // Đăng ký tài khoản
  // Trả về null nếu thành công, hoặc thông báo lỗi
  String? signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String dateOfBirth,
    required String gender,
  }) {
    // Kiểm tra password
    if (password != confirmPassword) {
      return "Password và Confirm Password không khớp!";
    }
    // Kiểm tra email đã tồn tại chưa
    if (_users.containsKey(email)) {
      return "Email này đã được đăng ký!";
    }
    // Thêm user vào danh sách
    _users[email] = UserModel(
      email: email,
      password: password,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
    return null; // success
  }

  // Đăng nhập Google (mô phỏng)
  bool signInWithGoogle() {
    // Giả lập user google@google.com
    _users.putIfAbsent(
      "google@google.com",
      () => UserModel(
        email: "google@google.com",
        password: "google_password",
        dateOfBirth: "N/A",
        gender: "N/A",
      ),
    );
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  // Đăng nhập Facebook (mô phỏng)
  bool signInWithFacebook() {
    // Giả lập user facebook@fb.com
    _users.putIfAbsent(
      "facebook@fb.com",
      () => UserModel(
        email: "facebook@fb.com",
        password: "fb_password",
        dateOfBirth: "N/A",
        gender: "N/A",
      ),
    );
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }
}
