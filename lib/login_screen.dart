import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:year_in_pixels/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onPressed;
  LoginScreen({super.key, required this.onPressed});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFF96635),
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //show error message
      ShowErrorMessage('Incorrect email or password');
    }
  }

  void ShowErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFFF96635),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EDD9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/user.png'),
                  width: 181,
                  height: 181,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    k_textField(
                        labelText: 'email', controller: emailController),
                    SizedBox(
                      height: 20,
                    ),
                    k_textField(
                      labelText: 'password',
                      controller: passwordController,
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text('Forget password?'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFFF96635),
                    ),
                  ),
                  onPressed: signIn,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Divider(
                    color: Color(0xFFF9A822),
                    height: 10,
                    indent: 30,
                    endIndent: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.apple,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 60,
                        height: 60,
                        child: Image(
                          image: AssetImage("images/google.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account yet?'),
                    TextButton(
                      onPressed: widget.onPressed,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFFF96635),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class k_textField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  k_textField({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Color(0xFFF9A822),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.white, // Set the border color to white
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors
                  .white, // Set the border color to white for enabled state
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors
                  .white, // Set the border color to white for focused state
            ),
          ),
        ),
      ),
    );
  }
}
