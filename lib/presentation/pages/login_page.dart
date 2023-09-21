// import 'package:firebase_auth/firebase_auth.dart';
import 'package:bubbleteaapp/config/theme.dart';
import 'package:bubbleteaapp/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

// User can signin using their email and password

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Login failed error message
  String errMsg = '';

  // Text controllers
  final newPhoneNumberController = TextEditingController();
  final newPasswordController = TextEditingController();

  // // Email password authentication
  // Future login() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithPhoneNumber(
  //       phoneNumber:
  //     );
  //   } catch (e) {
  //     errMsg = 'email or password is incorrect';
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text(errMsg),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('OK'))
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // @override
  // void dispose() {
  //   newEmailController.dispose();
  //   newPasswordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Bubble Luv",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'email',
                                  fillColor: Colors.grey[200],
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              controller: newPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'password',
                                  fillColor: Colors.grey[200],
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
