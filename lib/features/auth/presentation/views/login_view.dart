import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Gap(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormField(
                        controller: _emailController,
                        hintText: 'Enter Email Address',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormField(
                        onSaved: (value) {
                          _passwordController.text = value!;
                        },
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Enter Password',
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
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
