import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.freepik.com/free-psd/shoes-sale-social-media-post-square-banner-template-design_41548881.htm#fromView=search&page=1&position=49&uuid=f7b12465-f2bf-419c-ba1a-b1c58c585f16&query=product",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '10% off',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "product name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Old Price',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text('New Price'),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
