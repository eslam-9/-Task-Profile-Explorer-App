import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/color_manager.dart';
import '../../core/theme/text_manager.dart';
import '../../domain/entities/user.dart';
import '../widgets/like_button.dart';

class ProfileDetailScreen extends ConsumerWidget {
  final User user;
  const ProfileDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Likes handled inside LikeButton widget
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: user.id,
              child: Image.network(user.imageLarge, fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                  topRight: Radius.circular(28.r),
                ),
              ),
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 28.h),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.age}',
                      style: TextManager.profileDetailName,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'Location',
                      style: TextManager.profileDetailLocationLabel,
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${user.city}, ${user.country}',
                            style: TextManager.profileDetailLocationValue,
                          ),
                        ),
                        LikeButton(
                          userId: user.id,
                          likedColor: ColorManager.heartRed,
                          unlikedColor: Colors.black54,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
