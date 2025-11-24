import 'package:e_market/core/utils/app_colors.dart';
import 'package:e_market/core/widgets/custom_text_form_field.dart';
import 'package:e_market/features/auth/presentation/manager/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditName extends StatefulWidget {
  const EditName({super.key});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  // Controller عشان ناخد القيمة من الـ TextField
  final _nameController = TextEditingController();

  @override
  void dispose() {
    // مهم: نظف الـ controller لما الصفحة تقفل
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Name', textAlign: TextAlign.center),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        // listener: عشان نسمع للتغييرات
        listener: (context, state) {
          if (state is GetUserDataSuccess) {
            // لما التحديث ينجح
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Name updated successfully! ✅'),
                backgroundColor: Colors.green,
              ),
            );
            // ارجع للصفحة اللي قبلها
            Navigator.pop(context);
          }

          if (state is GetUserDataFailure) {
            // لو حصل خطأ
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),

              ),
            );
          }
        },
        // builder: عشان نعرض الـ UI
        builder: (context, state) {
          // لو بنحمّل (بنحدّث البيانات)
          if (state is GetUserDataSuccess) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Updating...'),
                ],
              ),
            );
          }

          // الـ UI العادي
          return Column(
            children: [
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormField(
                  controller: _nameController, // ✅ ربط الـ controller
                  keyboardType: TextInputType.name,
                  hintText: 'Enter your name',
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  // تحقق إن الـ name مش فاضي
                  if (_nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a name'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  // ✅ نادي على updateUser من الـ Cubit
                  context.read<AuthenticationCubit>().updateUser({
                    'name': _nameController.text.trim(),
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
