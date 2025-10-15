import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../likes/likes_notifier.dart';

class LikeButton extends ConsumerWidget {
  final String userId;
  final Color likedColor;
  final Color unlikedColor;
  final double size;

  const LikeButton({
    super.key,
    required this.userId,
    this.likedColor = Colors.red,
    this.unlikedColor = Colors.white,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liked = ref.watch(likesProvider).contains(userId);
    final notifier = ref.read(likesProvider.notifier);

    return InkWell(
      onTap: () => notifier.toggle(userId),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: liked ? 1.1 : 1.0,
        child: Icon(
          liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? likedColor : unlikedColor,
          size: size.sp,
        ),
      ),
    );
  }
}
