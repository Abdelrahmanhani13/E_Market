import 'package:e_market/features/home/presentation/widgets/product_card.dart';
import 'package:e_market/features/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Store'),surfaceTintColor: Colors.white,backgroundColor: Colors.white,),
      body: ListView(
        children: [
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {},
              child: const SearchTextField(),
            ),
          ),
          const Gap(20),

          // Fixed: Using shrinkWrap and physics
          ListView.builder(
            shrinkWrap: true, // Important: allows ListView to size itself
            physics:
                const NeverScrollableScrollPhysics(), // Disables inner scroll
            padding: const EdgeInsets.only(top: 15),
            itemCount: 6,
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ],
      ),
    );
  }
}
