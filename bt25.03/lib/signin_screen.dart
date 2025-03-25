// lib/screens/signin_screen.dart
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'number_screen.dart';

class SignInScreen extends StatelessWidget {
  // Google Sign-In Method
  Future<void> _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // Navigate to next screen or perform login logic
      }
    } catch (error) {
      print(error);
    }
  }

  // Facebook Sign-In Method
  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Navigate to next screen or perform login logic
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Get your groceries with nectar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CountryCodePicker(
              onChanged: (country) {
                // Selected country code will be used in Number screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NumberScreen(
                      selectedCountryCode: country.dialCode ?? '+880',
                    ),
                  ),
                );
              },
              initialSelection: 'BD', // Default to Bangladesh
              favorite: const ['+880', 'BD'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _signInWithGoogle(context),
              icon: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/google_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              label: const Text('Continue with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _signInWithFacebook(context),
              icon: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/facebook_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              label: const Text('Continue with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
