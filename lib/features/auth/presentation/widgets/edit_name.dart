import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Name', textAlign: TextAlign.center),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFormField(
              keyboardType: TextInputType.name,
              hintText: 'Enter your name',
            ),
          ),
          Gap(20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Text('Update',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
