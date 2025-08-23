import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// AppBar مخصص لشاشة إضافة الوجبة

class AddMealAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddMealAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text('Add Meal', style: AppStyles.black16Medium),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
