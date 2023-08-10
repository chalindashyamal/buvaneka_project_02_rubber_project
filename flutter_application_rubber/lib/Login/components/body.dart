import 'package:flutter/material.dart';
import 'package:flutter_application_rubber/Components/Rounded_password_field.dart';
import 'package:flutter_application_rubber/Components/already_have_an_account_check.dart';
import 'package:flutter_application_rubber/Components/text_field_container.dart';
import 'package:flutter_application_rubber/Login/components/background.dart';

import '../../Components/rounded_input_field.dart';

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
          Text(
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
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            child: TextButton(
              onPressed: () {},
              child: Text(
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
