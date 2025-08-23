import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('الإعدادات', style: AppStyles.black16Medium),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.person, size: 30.sp, color: Colors.white),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('المستخدم', style: AppStyles.black16Medium),
                      SizedBox(height: 5.h),
                      Text(
                        'user@example.com',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // Settings Options
            _buildSettingItem(
              icon: Icons.person_outline,
              title: 'الملف الشخصي',
              subtitle: 'تعديل معلوماتك الشخصية',
              onTap: () {
                // Navigate to profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('الملف الشخصي قريباً')),
                );
              },
            ),

            _buildSettingItem(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              subtitle: 'إدارة الإشعارات والتنبيهات',
              onTap: () {
                // Navigate to notifications
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('إعدادات الإشعارات قريباً')),
                );
              },
            ),

            _buildSettingItem(
              icon: Icons.language_outlined,
              title: 'اللغة',
              subtitle: 'العربية',
              onTap: () {
                // Navigate to language settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('إعدادات اللغة قريباً')),
                );
              },
            ),

            _buildSettingItem(
              icon: Icons.dark_mode_outlined,
              title: 'المظهر',
              subtitle: 'الوضع الفاتح/الداكن',
              onTap: () {
                // Navigate to theme settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('إعدادات المظهر قريباً')),
                );
              },
            ),

            _buildSettingItem(
              icon: Icons.help_outline,
              title: 'المساعدة والدعم',
              subtitle: 'الأسئلة الشائعة والتواصل',
              onTap: () {
                // Navigate to help
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('صفحة المساعدة قريباً')),
                );
              },
            ),

            const Spacer(),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.white, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: AppColors.primaryColor, size: 24.sp),
        ),
        title: Text(title, style: AppStyles.black16Medium),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.sp,
          color: Colors.grey[400],
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        tileColor: Colors.grey[50],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تسجيل الخروج', style: AppStyles.black16Medium),
          content: const Text('هل أنت متأكد من أنك تريد تسجيل الخروج؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء', style: TextStyle(color: Colors.grey[600])),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle logout logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم تسجيل الخروج')),
                );
              },
              child: Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
