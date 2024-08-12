import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onPressed;
  RegisterScreen({super.key, required this.onPressed});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFF96635),
            ),
          );
        });
//just testing might delete later
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context);
        showErrorMessage("Passwords are not the same");
      }
      //stop circling
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //stop circling
      Navigator.pop(context);
      //show error message
      showErrorMessage('Incorrect email or password');
    }
  }

  void showErrorMessage(String message) {
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
                    SizedBox(
                      height: 20,
                    ),
                    k_textField(
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
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
                  onPressed: signUp,
                  child: Text(
                    'Sign up',
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
                    Text('Already have an accout?'),
                    TextButton(
                      onPressed: widget.onPressed,
                      child: Text(
                        'Log In ',
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
