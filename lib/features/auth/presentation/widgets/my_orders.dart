import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text('My Orders'),
      ),
      body:ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      )
    );
  }
}
