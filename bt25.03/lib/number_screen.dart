// lib/screens/number_screen.dart
import 'package:flutter/material.dart';
import 'verification_screen.dart';

class NumberScreen extends StatefulWidget {
  final String selectedCountryCode;

  NumberScreen({required this.selectedCountryCode});

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String? _errorText;

  void _validateAndProceed() {
    final phoneNumber = _phoneController.text.trim();

    if (ValidationUtils.isValidPhoneNumber(phoneNumber)) {
      // Navigate to Verification Screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerificationScreen(
                  phoneNumber: widget.selectedCountryCode + phoneNumber)));
    } else {
      setState(() {
        _errorText = 'Invalid phone number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your mobile number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  widget.selectedCountryCode,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      errorText: _errorText,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _validateAndProceed,
              child: Icon(Icons.arrow_forward, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// lib/utils/validation_utils.dart
class ValidationUtils {
  static bool isValidPhoneNumber(String phoneNumber) {
    // Basic phone number validation
    // You can enhance this with more robust validation
    return phoneNumber.length >= 9 && phoneNumber.length <= 12;
  }
}
