import 'package:chat_app_with_mk/services/auth/auth_service.dart';
import 'package:chat_app_with_mk/widgets/my_button.dart';
import 'package:chat_app_with_mk/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;
  RegisterScreen({
    super.key,
    required this.onTap,
  });
  void register(BuildContext context) {
    final auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.telegram,
            size: 90,
            color: Colors.blue,
          ),
          const SizedBox(height: 50),
          const Text(
            "Let's join us ! Chat App",
            style: TextStyle(
              fontSize: 26,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 50),
          MyTextfield(
            hintText: "Email",
            controller: _emailController,
            obscureTeext: false,
          ),
          const SizedBox(height: 10),
          MyTextfield(
            hintText: "Password",
            controller: _passwordController,
            obscureTeext: true,
          ),
          const SizedBox(height: 10),
          MyTextfield(
            hintText: "Confirm password",
            controller: _confirmPasswordController,
            obscureTeext: true,
          ),
          const SizedBox(height: 25),
          MyButton(
            buttonText: "Register",
            onTap: () => register(context),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account?",
                style: TextStyle(color: Colors.blue.shade900),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  " Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
