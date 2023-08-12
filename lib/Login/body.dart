import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rubber/Components/already_have_an_account_check.dart';
import '../Components/rounded_password_input_field.dart';
import '../Components/rounded_text_input_field.dart';
import '../Signup/background.dart';
import '../auth.dart';
import '../dashboard.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? errorMessage = '';
  String email = '';
  String password = '';
  bool isSignedIn = false;

  Future<void> signInWithEmailAndPassword() async {
    if (password.length < 6) {
      setState(() {
        errorMessage = 'Password must be at least 6 characters';
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        errorMessage = 'Please enter a valid email address';
      });
      return;
    }

    try {
      await Auth().signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        errorMessage = null;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        } else {
          errorMessage = e.toString();
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }

    if (errorMessage == null) {
      setState(() {
        isSignedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: size.height * 0.35,
                ),
              ],
            ),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            if (!isSignedIn)
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            if (!isSignedIn)
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            if (!isSignedIn)
              Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(29)),
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                child: TextButton(
                  onPressed: () {
                    signInWithEmailAndPassword();
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            if (!isSignedIn)
              AlreadyHaveAnAccountCheck(
                press: () {
                  // Handle navigation or any other action here
                },
              ),
            if (isSignedIn)
              Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(29)),
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                child: TextButton(
                  onPressed: () {
                    // Navigate to dashboard.dart DashboardScreen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  },
                  child: const Text(
                    "GO TO DASHBOARD",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
