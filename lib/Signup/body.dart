import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rubber/Components/rounded_password_input_field.dart';
import 'package:flutter_application_rubber/Components/rounded_text_input_field.dart';
import 'package:flutter_application_rubber/Signup/background.dart';
import '../Components/already_have_an_account_check.dart';
import '../Login/login_screen.dart';
import '../auth.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? errorMessege;
  String? successMessage;
  String email = '';
  String password = '';

  Future<void> signUpWithEmailAndPassword() async {
    if (password.length < 6) {
      setState(() {
        errorMessege = 'Password must be at least 6 characters';
        successMessage = null;
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        errorMessege = 'Please enter a valid email address';
        successMessage = null;
      });
      return;
    }

    try {
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);
      setState(() {
        errorMessege = null;
        successMessage = 'Account created successfully';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'weak-password') {
          errorMessege = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessege = 'The account already exists for that email.';
        } else {
          errorMessege = e.toString();
        }
        successMessage = null;
      });
    } catch (e) {
      setState(() {
        errorMessege = e.toString();
        successMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.35,
              ),
              if (errorMessege != null)
                Text(
                  errorMessege!,
                  style: const TextStyle(color: Colors.red),
                ),
              if (successMessage != null)
                Text(
                  successMessage!,
                  style: const TextStyle(color: Colors.green),
                ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(29),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                child: TextButton(
                  onPressed: () {
                    signUpWithEmailAndPassword();
                  },
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginscreen()),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const OrDivider(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Please fill details",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: const Divider(),
    );
  }
}
