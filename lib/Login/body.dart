import 'package:flutter/material.dart';
import 'package:flutter_application_rubber/Components/already_have_an_account_check.dart';
import '../Components/rounded_password_input_field.dart';
import '../Components/rounded_text_input_field.dart';
import '../Signup/background.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Positioned(
            child: Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(29)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          AlreadyHaveAnAccountCheck(
            press: () {},
          ),
        ],
      ),
    );
  }
}
