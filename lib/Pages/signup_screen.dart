import 'package:flutter/material.dart';
import 'package:leplan/Pages/home_screen.dart';
import 'package:leplan/reusable_widgets/reusable_widgets.dart';
import 'package:leplan/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}):super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailEditTextController = TextEditingController();
  TextEditingController _passwordEditTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                  reUsableTextField("Enter First name", Icons.person_outline,
                      false, _emailEditTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reUsableTextField("Enter Last name", Icons.person_outline,
                      false, _emailEditTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reUsableTextField("Enter Phone", Icons.phone,
                      false, _emailEditTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reUsableTextField("Enter password", Icons.lock_outline, true,
                      _passwordEditTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reUsableTextField("Enter password", Icons.lock_outline, true,
                      _passwordEditTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableSignInSignUpButton(context, false, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  })
                ],
              ),
            ),
          )
      ),
    );
  }
}
