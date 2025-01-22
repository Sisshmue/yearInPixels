import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onPressed;
  const RegisterScreen({super.key, required this.onPressed});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFF96635),
          ),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // If we get here, sign up was successful
        if (mounted) {
          // Check if widget is still mounted
          Navigator.of(context).pop(); // Close the loading dialog
        }
      } else {
        // Close loading dialog before showing error
        if (mounted) {
          Navigator.of(context).pop();
          showErrorMessage("Passwords are not the same");
        }
      }
    } on FirebaseAuthException catch (e) {
      // Close loading dialog before showing error
      if (mounted) {
        Navigator.of(context).pop();
        showErrorMessage(
            e.code); // Use e.code instead of e.toString() for cleaner errors
      }
    } catch (e) {
      // Handle any other errors
      if (mounted) {
        Navigator.of(context).pop();
        showErrorMessage("An error occurred");
      }
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
            backgroundColor: const Color(0xFFF96635),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EDD9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/user.png'),
                  width: 181,
                  height: 181,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    KTextField(labelText: 'email', controller: emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    KTextField(
                      labelText: 'password',
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    KTextField(
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xFFF96635),
                    ),
                  ),
                  onPressed: signUp,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Divider(
                    color: Color(0xFFF9A822),
                    height: 10,
                    indent: 30,
                    endIndent: 30,
                  ),
                ),
                const SizedBox(
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
                      child: const Icon(
                        Icons.apple,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
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
                        child: const Image(
                          image: AssetImage("images/google.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an accout?'),
                    TextButton(
                      onPressed: widget.onPressed,
                      child: const Text(
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

class KTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const KTextField(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: const Color(0xFFF9A822),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.white, // Set the border color to white
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors
                  .white, // Set the border color to white for enabled state
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors
                  .white, // Set the border color to white for focused state
            ),
          ),
        ),
      ),
    );
  }
}
