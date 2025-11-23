import 'package:e_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final List<Widget>views = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:views[0],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            rippleColor:
                AppColors.primaryColor, // tab button ripple color when pressed
            hoverColor: AppColors.primaryColor, // tab button hover color
            tabBorderRadius: 15, // tab button border // tab button shadow
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 24, // tab button icon size
            // ignore: deprecated_member_use
            tabBackgroundColor:
                AppColors.primaryColor, // selected tab background color
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ), // navigation bar padding
            tabs: [
              GButton(icon: LineIcons.home, text: 'Home'),
              GButton(icon: LineIcons.store, text: 'Likes'),
              GButton(icon: LineIcons.heart, text: 'Search'),
              GButton(icon: LineIcons.user, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
