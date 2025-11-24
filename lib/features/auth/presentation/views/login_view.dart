import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:e_market/features/auth/presentation/manager/cubit/authentication_cubit.dart';
import 'package:e_market/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_market/features/auth/presentation/views/signup_view.dart';
import 'package:e_market/features/nav_bar/presentation/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // ✅ لو Login فشل
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }

        // ✅ لو Login نجح
        if (state is LoginSuccess) {
          // اجلب بيانات اليوزر
          context.read<AuthenticationCubit>().fetchUser();
        }

        // ✅ لما بيانات اليوزر تتجاب بنجاح
        if (state is GetUserDataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Welcome back! ✅'),
              backgroundColor: Colors.green,
            ),
          );

          // روح على BottomNavBar وامسح كل الصفحات اللي قبلها
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: context.read<AuthenticationCubit>(),
                child: BottomNavBar(),
              ),
            ),
            (route) => false,
          );
        }

        // ✅ لو فشل جلب بيانات اليوزر
        if (state is GetUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load user data: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // ✅ لو بيعمل Login أو بيجلب بيانات اليوزر
          body: (state is LoginLoading || state is GetUserDataLoading)
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primaryColor),
                      Gap(16),
                      Text(
                        'Signing in...',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor.withOpacity(0.8),
                        AppColors.primaryColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Gap(80),

                            // Logo + Title
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(22),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.25),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.shopping_bag,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(24),
                                const Text(
                                  'E Market',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Shop Smart, Live Easy',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),

                            const Gap(60),

                            // Login Card
                            Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.16),
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1.8,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Welcome Back!',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Text(
                                    'Sign in to continue shopping',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                    ),
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
                                      onPressed: () => setState(
                                        () => _obscureText = !_obscureText,
                                      ),
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  const Gap(12),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        // ✅ استخدم push بدل pushReplacement
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider.value(
                                                  value: context
                                                      .read<
                                                        AuthenticationCubit
                                                      >(),
                                                  child:
                                                      const ForgotPasswordView(),
                                                ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),

                                  SizedBox(
                                    width: double.infinity,
                                    height: 58,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // ✅ تحقق من الـ validation
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        // ✅ تحقق إن الحقول مش فاضية
                                        if (_emailController.text
                                                .trim()
                                                .isEmpty ||
                                            _passwordController.text.isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Please fill all fields',
                                              ),
                                              backgroundColor: Colors.orange,
                                            ),
                                          );
                                          return;
                                        }

                                        // ✅ كل حاجة تمام، نادي على login
                                        context
                                            .read<AuthenticationCubit>()
                                            .login(
                                              email: _emailController.text
                                                  .trim(),
                                              password:
                                                  _passwordController.text,
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: AppColors.primaryColor,
                                        elevation: 12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(24),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t have an account? ',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // ✅ استخدم push بدل pushReplacement
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BlocProvider.value(
                                                    value: context
                                                        .read<
                                                          AuthenticationCubit
                                                        >(),
                                                    child: const SignUpView(),
                                                  ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
