import 'package:flutter/material.dart';
import 'package:studybuddy/pages/login_page.dart';
import 'package:studybuddy/pages/home_page.dart';
import 'package:studybuddy/data/signup_data.dart';
import 'package:studybuddy/widgets/signup_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final data = SignUpData();

  void _moveFocus(TextEditingController controller, FocusNode nextFocus) {
    if (controller.text.isNotEmpty) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  @override
  void dispose() {
    data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.redAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                buildSignUpTextField(
                  controller: data.firstNameController,
                  hint: 'firstname',
                  onEditingComplete: () =>
                      _moveFocus(data.firstNameController, data.lastNameFocus),
                ),
                const SizedBox(height: 15),
                buildSignUpTextField(
                  controller: data.lastNameController,
                  hint: 'lastname',
                  focusNode: data.lastNameFocus,
                  onEditingComplete: () =>
                      _moveFocus(data.lastNameController, data.emailFocus),
                ),
                const SizedBox(height: 15),
                buildSignUpTextField(
                  controller: data.emailController,
                  hint: 'email',
                  focusNode: data.emailFocus,
                  onEditingComplete: () =>
                      _moveFocus(data.emailController, data.passwordFocus),
                ),
                const SizedBox(height: 15),
                buildSignUpTextField(
                  controller: data.passwordController,
                  hint: 'password',
                  isPassword: true,
                  focusNode: data.passwordFocus,
                  onEditingComplete: () => _moveFocus(
                      data.passwordController, data.confirmPasswordFocus),
                ),
                const SizedBox(height: 15),
                buildSignUpTextField(
                  controller: data.confirmPasswordController,
                  hint: 'confirm password',
                  isPassword: true,
                  focusNode: data.confirmPasswordFocus,
                  onEditingComplete: () {
                    if (data.confirmPasswordController.text.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 220),
                const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 14, 17, 211),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
