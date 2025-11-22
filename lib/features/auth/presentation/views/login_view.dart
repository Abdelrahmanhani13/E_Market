import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Gap(100),
            Text('Welcome to E Market'),
            Gap(20),
            Text('Login'),
          ],
        ),
      ),
    );
  }
}
