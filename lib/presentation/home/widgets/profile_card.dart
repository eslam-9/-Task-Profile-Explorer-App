import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/theme/text_manager.dart';
import '../../../domain/entities/user.dart';
import '../../widgets/like_button.dart';

class ProfileCard extends ConsumerWidget {
  final User user;
  final VoidCallback onTap;
  const ProfileCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 213.w,
        height: 250.h,
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Hero(
                tag: user.id,
                child: Image.network(
                  user.imageLarge,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16.w,
                bottom: 24.h,
                right: 60.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.age}',
                      style: TextManager.cardNameAndAge,
                    ),
                    SizedBox(height: 4.h),
                    Text(user.city, style: TextManager.cardCity),
                  ],
                ),
              ),
              Positioned(
                bottom: 44.h,
                right: 16.w,
                child: LikeButton(
                  userId: user.id,
                  likedColor: ColorManager.heartRed,
                  unlikedColor: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
