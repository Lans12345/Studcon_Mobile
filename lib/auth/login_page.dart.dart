import 'package:consultation_system_mobile/auth/signup_page.dart.dart';
import 'package:consultation_system_mobile/screens/home_screen.dart';
import 'package:consultation_system_mobile/widgets/button_widget.dart';
import 'package:consultation_system_mobile/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    email = _input;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    password = _input;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: password);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: TextRegular(
                                    text: "$e",
                                    color: Colors.black,
                                    fontSize: 12),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: TextBold(
                                        text: 'Close',
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                ],
                              ));
                    }
                  },
                  text: 'Login'),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextRegular(
                      text: "Haven't registered yet?",
                      fontSize: 14,
                      color: Colors.grey),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                    },
                    child: TextBold(
                        text: "Register now",
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
