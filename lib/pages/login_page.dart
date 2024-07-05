import 'package:chat_app_with_mk/services/auth/auth_service.dart';
import 'package:chat_app_with_mk/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_with_mk/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({
    Key? key,
    required this.onTap,
  });

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.singinWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
          Icon(
            Icons.telegram,
            size: 90,
            color: Colors.blue,
          ),
          const SizedBox(height: 50),
          Text(
            "Chat App",
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
          const SizedBox(height: 25),
          MyButton(
            buttonText: "Login",
            onTap: () => login(context),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  " Register Now",
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
