import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/services/auth_service.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/square_image.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authService = AuthService();

  void register(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.teal,
          ));
        });

    authService.register(context, emailController.text, passwordController.text,
        confirmPasswordController.text);
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
            MyTextfield(
                controller: confirmPasswordController,
                text: 'Confirm Password',
                obsecureText: true),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
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
          ],
        ),
      )),
    );
  }
}
