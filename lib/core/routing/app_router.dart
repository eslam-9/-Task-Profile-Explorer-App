import 'package:flutter/material.dart';
import '../../presentation/home/home_screen.dart';
import '../../domain/entities/user.dart';
import '../../presentation/details/profile_detail_screen.dart';

class Routes {
  static const String home = '/';
  static const String profileDetail = '/profile';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case Routes.profileDetail:
      final user = settings.arguments as User;
      return MaterialPageRoute(builder: (_) => ProfileDetailScreen(user: user));
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(body: Center(child: Text('404'))),
      );
  }
}
