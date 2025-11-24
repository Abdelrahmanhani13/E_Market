import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:e_market/features/auth/presentation/manager/cubit/authentication_cubit.dart';
import 'package:e_market/features/nav_bar/presentation/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // ✅ لو SignUp فشل
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }

        // ✅ لو AddUserData فشل
        if (state is AddUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save user data: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }

        // ✅ لو SignUp و AddUserData نجحوا
        if (state is AddUserDataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully Signed Up! ✅'),
              backgroundColor: Colors.green,
            ),
          );

          // ✅ روح على BottomNavBar وامسح كل الصفحات اللي قبلها
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: context.read<AuthenticationCubit>(),
                child:  BottomNavBar(),
              ),
            ),
            (route) => false, // امسح كل الصفحات
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // ✅ لو بيعمل SignUp أو بيضيف بيانات اليوزر
          body: (state is SignUpLoading || state is AddUserDataLoading)
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primaryColor),
                      Gap(16),
                      Text(
                        'Creating your account...',
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
                                    Icons.add_shopping_cart,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(24),
                                const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Join E Market Today!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(60),
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
                                    'Get Started Now',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Gap(32),
                                  CustomTextFormField(
                                    controller: _nameController,
                                    hintText: 'Full Name',
                                    prefixIcon: Icons.person_outline,
                                    keyboardType: TextInputType.name,
                                  ),
                                  const Gap(18),
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
                                    obscureText: _obscurePassword,
                                    prefixIcon: Icons.lock_outline,
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      ),
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  const Gap(18),
                                  CustomTextFormField(
                                    controller: _confirmController,
                                    hintText: 'Confirm Password',
                                    obscureText: _obscureConfirm,
                                    prefixIcon: Icons.lock_reset_outlined,
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(
                                        () =>
                                            _obscureConfirm = !_obscureConfirm,
                                      ),
                                      icon: Icon(
                                        _obscureConfirm
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  const Gap(28),
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

                                        // ✅ تحقق إن الـ passwords متطابقة
                                        if (_passwordController.text !=
                                            _confirmController.text) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Passwords do not match!',
                                              ),
                                              backgroundColor: Colors.orange,
                                            ),
                                          );
                                          return;
                                        }

                                        // ✅ تحقق إن الاسم مش فاضي
                                        if (_nameController.text
                                            .trim()
                                            .isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Please enter your name',
                                              ),
                                              backgroundColor: Colors.orange,
                                            ),
                                          );
                                          return;
                                        }

                                        // ✅ كل حاجة تمام، نادي على signUp
                                        context
                                            .read<AuthenticationCubit>()
                                            .signUp(
                                              email: _emailController.text
                                                  .trim(),
                                              password:
                                                  _passwordController.text,
                                              name: _nameController.text.trim(),
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
                                        'Create Account',
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
                                        'Already have an account? ',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // ✅ استخدم pop بدل pushReplacement
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Login Now',
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
