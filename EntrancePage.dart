import 'package:flutter/material.dart';
import 'package:archipanion/SignInPage.dart';
import 'package:archipanion/SignUpPage.dart';

class EntrancePage extends StatefulWidget {
  @override
  _EntrancePageState createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  // Method to handle navigation to different pages
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          OverlayContainer(),
          ContentColumn(
            onSignIn: () => _navigateTo(context, SignInPage()),
            onSignUp: () => _navigateTo(context, SignUpPage()),
          ),
        ],
      ),
    );
  }
}

// Background Image Component
class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/bg.jpg'), 
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Overlay Container Component
class OverlayContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
    );
  }
}

// Content Column Component
class ContentColumn extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onSignUp;

  ContentColumn({required this.onSignIn, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //AppLogo(),
        SizedBox(height: 20),
        WelcomeText(),
        SizedBox(height: 50),
        SignInButton(onPressed: onSignIn),
        SizedBox(height: 20),
        SignUpButton(onPressed: onSignUp),
      ],
    );
  }
}

// App Logo Component
/*class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: 50,
        width: 50,
      ), // Replace with your logo image
    );
  }
}
*/
// Welcome Text Component
class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Archipanion',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Learn Architect Tool, Make Good Construction !',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// Sign In Button Component
class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  SignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            side: BorderSide(color: Colors.white)),
        child: Center(
          child: Text(
            'Sign In',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Sign Up Button Component
class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  SignUpButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(color: Colors.white),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
