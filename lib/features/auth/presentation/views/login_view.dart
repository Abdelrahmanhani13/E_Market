import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Gap(100),
            Text(
              'Welcome to E Market',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Gap(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormField(
                        hintText: 'Enter Email Address',
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormField(
                        hintText: 'Enter Password',
                        obscureText: true, textInputType: TextInputType.visiblePassword,
                      ),
                    ),
                    Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
