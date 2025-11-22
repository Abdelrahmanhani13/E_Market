// views/profile/profile_view.dart

import 'package:e_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:ui';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
            child: Column(
              children: [
                const Gap(30),

                // Avatar مكان الصورة (أيقونة شخص فقط)
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.25),
                    border: Border.all(color: Colors.white, width: 6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),

                const Gap(24),

                // الاسم والإيميل
                const Text(
                  'Abdelrahman Hani',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap(10),
                const Text(
                  'ahmed@example.com',
                  style: TextStyle(fontSize: 17, color: Colors.white70),
                ),
                const Gap(12),

                // Premium Badge

                // القائمة الزجاجية
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildTile(
                            Icons.person_outline,
                            'Edit Profile',
                            () {},
                          ),
                          _buildDivider(),
                          _buildTile(
                            Icons.shopping_bag_outlined,
                            'My Orders',
                            () {},
                          ),
                          _buildDivider(),
                          _buildTile(
                            Icons.location_on_outlined,
                            'Delivery Addresses',
                            () {},
                          ),
                          _buildDivider(),
                          _buildTile(
                            Icons.payment_outlined,
                            'Payment Methods',
                            () {},
                          ),
                          _buildDivider(),
                          _buildTile(Icons.favorite_border, 'Wishlist', () {}),
                          _buildDivider(),
                          _buildTile(
                            Icons.help_outline,
                            'Help & Support',
                            () {},
                          ),
                          _buildDivider(),
                          _buildTile(
                            Icons.settings_outlined,
                            'Settings',
                            () {},
                          ),

                          const Gap(28),

                          // زر Logout
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: Logout
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('تم تسجيل الخروج بنجاح'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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

  Widget _buildTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 28),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white70,
        size: 18,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 30,
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.3),
      height: 32,
      thickness: 0.8,
      indent: 56,
      endIndent: 12,
    );
  }
}
