import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List users = [
      "rrr@gmail.com",
      "ronaldo@gmail.com",
      "bir@gmail.com",
      "ikki@gmail.com",
      "new@gmail.com",
      "main@gmail.com",
      "nimadir@gmail.com",
      "flutter@gmail.com",
    ];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 25),
            Text(users.contains(text) ? "User" : text),
          ],
        ),
      ),
    );
  }
}
