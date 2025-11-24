import 'package:e_market/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Favorite Products')),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
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
