import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/routing/app_router.dart';
import '../../core/theme/text_manager.dart';
import '../../presentation/home/home_viewmodel.dart';
import '../../presentation/home/widgets/profile_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final vm = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: vm.refresh,
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => ListView(
            children: [
              SizedBox(height: 200.h),
              Center(
                child: Column(
                  children: [
                    Text('Failed to load', style: TextManager.errorMessage),
                    SizedBox(height: 8.h),
                    ElevatedButton(
                      onPressed: vm.fetch,
                      child: Text('Retry', style: TextManager.buttonText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          data: (users) => Padding(
            padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 213.w,
                mainAxisExtent: 250.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ProfileCard(
                  user: user,
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(Routes.profileDetail, arguments: user),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
