// views/auth/login_view.dart
import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/core/utils/app_router.dart';
import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              // ignore: deprecated_member_use
              AppColors.primaryColor.withOpacity(0.8),
              // ignore: deprecated_member_use
              AppColors.primaryColor.withOpacity(0.5),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Gap(80),

                // Logo + Title
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.shopping_bag, size: 70, color: Colors.white),
                    ),
                    const Gap(24),
                    const Text(
                      'E Market',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Text(
                      'Shop Smart, Live Easy',
                      style: TextStyle(fontSize: 17, color: Colors.white70),
                    ),
                  ],
                ),

                const Gap(60),

                // Login Card
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(32),
                        // ignore: deprecated_member_use
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome Back!',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const Gap(8),
                          const Text(
                            'Sign in to continue shopping',
                            style: TextStyle(fontSize: 15, color: Colors.white70),
                          ),
                          const Gap(32),

                          CustomTextFormField(
                            controller: _emailController,
                            hintText: 'Email Address',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                          ),
                          const Gap(18),

                          CustomTextFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            obscureText: _obscureText,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: IconButton(
                              onPressed: () => setState(() => _obscureText = !_obscureText),
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              ),
                            ), keyboardType: TextInputType.visiblePassword,
                          ),
                          const Gap(12),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                context.go(AppRouter.kForgotPasswordView);
                              },
                              child: const Text('Forgot Password?', style: TextStyle(color: Colors.white70)),
                            ),
                          ),
                          const Gap(20),

                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primaryColor,
                                elevation: 12,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                              ),
                              child: const Text('Login', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const Gap(24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account? ', style: TextStyle(color: Colors.white70)),
                              GestureDetector(
                                onTap: () => context.go(AppRouter.kSignUpView),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}