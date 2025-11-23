import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/features/home/data/categories.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    child: Icon(categories[index].icon),
                  ),
                  Text(categories[index].title),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
