import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  VerificationScreen({required this.phoneNumber});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _verificationCode = '';
  int _remainingTime = 120; // 2 minutes
  bool _canResendCode = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _remainingTime--;
        });

        if (_remainingTime > 0) {
          _startTimer();
        } else {
          _canResendCode = true;
        }
      }
    });
  }

  void _resendCode() {
    if (_canResendCode) {
      // Implement code resend logic
      setState(() {
        _remainingTime = 120;
        _canResendCode = false;
      });
      _startTimer();
    }
  }

  void _verifyCode() {
    if (_verificationCode.length == 4) {
      // Implement verification logic
      print('Verified Code: $_verificationCode');
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
              'Enter your 4-digit code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) {
                setState(() {
                  _verificationCode = value;
                });
              },
              onCompleted: (_) => _verifyCode(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _canResendCode ? _resendCode : null,
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        color: _canResendCode ? Colors.green : Colors.grey),
                  ),
                ),
                Text(
                  'Time remaining: $_remainingTime seconds',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _verificationCode.length == 4 ? _verifyCode : null,
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
