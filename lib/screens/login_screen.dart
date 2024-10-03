import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/register_screen.dart';
import 'package:my_chat_app/services/auth_service.dart';
import 'package:my_chat_app/widgets/my_button.dart';
import 'package:my_chat_app/widgets/my_textfield.dart';
import 'package:my_chat_app/widgets/square_image.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();

  void login(BuildContext context) {

    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(color: Colors.teal,));
    });

    authService.login(context, emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.lock,
                  color: Colors.teal,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 24,
                ),
                MyTextfield(
                  text: 'Email',
                  controller: emailController,
                  obsecureText: false,
                ),
                MyTextfield(
                    controller: passwordController,
                    text: 'Password',
                    obsecureText: true),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.grey.shade700),
                      )
                    ],
                  ),
                ),
                MyButton(
                  text: 'Login',
                  onTap: () => login(context),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareImage(imagePath: 'assets/images/google.png'),
                    SizedBox(
                      width: 24,
                    ),
                    SquareImage(imagePath: 'assets/images/apple-logo.png')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
