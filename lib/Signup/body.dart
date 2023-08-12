import "package:flutter/material.dart";
import "package:flutter_application_rubber/Components/Rounded_password_field.dart";
import "package:flutter_application_rubber/Components/rounded_input_field.dart";
import "package:flutter_application_rubber/Signup/background.dart";
import "package:flutter_svg/svg.dart";

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "SIGNUP",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.35,
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
                "SIGNUP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Already have an Account ?",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                " Sign in",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const OrDivider(),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Please fill details",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: const Row(children: <Widget>[
        Expanded(
          child: Divider(),
        ),
      ]),
    );
  }
}
