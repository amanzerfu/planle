import 'package:flutter/material.dart';
import 'package:leplan/Pages/signup_screen.dart';
import 'package:leplan/reusable_widgets/reusable_widgets.dart';
import 'package:leplan/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailEditTextController = TextEditingController();
  TextEditingController _passwordEditTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("c82893"),
          hexStringToColor("9546c4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/MORES.png"),
                SizedBox(
                  height: 30,
                ),
                reUsableTextField("Enter user name", Icons.person_outline,
                    false, _emailEditTextController),
                SizedBox(
                  height: 20,
                ),
                reUsableTextField("Enter password", Icons.lock_outline, true,
                    _passwordEditTextController),
                SizedBox(
                  height: 20,
                ),
                reusableSignInSignUpButton(context, true, () {}),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}