import 'package:e_market/features/home/data/categories.dart';
import 'package:e_market/features/home/presentation/widgets/categories_list.dart';
import 'package:e_market/features/home/presentation/widgets/product_card.dart';
import 'package:e_market/features/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Categories> categories = [
      Categories(icon: Icons.sports, title: 'Sports'),
      Categories(icon: Icons.tv, title: 'Electronics'),
      Categories(icon: Icons.collections, title: 'Collections'),
      Categories(icon: Icons.book, title: 'Books'),
      Categories(icon: Icons.games, title: 'Games'),
    ];
    return Scaffold(
      body: ListView(
        children: [
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(onTap: () {}, child: SearchTextField()),
          ),
          Gap(20),
          Image.asset('assets/images/buy.jpg'),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Popular Categories', style: TextStyle(fontSize: 20)),
          ),
          Gap(15),
          CategoriesList(categories: categories),
          Gap(20),
          ProductCard(),
        ],
      ),
    );
  }
}

