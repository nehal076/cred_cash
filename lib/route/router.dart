import 'package:cred/route/screens.dart';
import 'package:cred/route/slide_up_page_builder.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/screens/home/home_screen.dart';
import 'package:cred/screens/second_view/second_view_expanded.dart';
import 'package:cred/screens/splash_screen.dart';
import 'package:cred/screens/success_screen.dart';
import 'package:cred/screens/third_view/third_view_expanded.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
          settings: settings,
        );
      case Screens.first_view:
        return SlideUpRoute(
          oldScreens: [
            const HomeScreen(),
          ],
          nextScreen: const FirstViewExpanded(),
        );
      case Screens.second_view:
        return SlideUpRoute(
          oldScreens: [
            const HomeScreen(),
            const FirstViewExpanded(collapse: true),
          ],
          nextScreen: const SecondViewExpanded(),
        );

      case Screens.third_view:
        return SlideUpRoute(
          oldScreens: [
            const HomeScreen(),
            const FirstViewExpanded(collapse: true),
            const SecondViewExpanded(collapse: true),
          ],
          nextScreen: const ThirdViewExpanded(),
        );

      case Screens.success_view:
        return MaterialPageRoute(builder: (context) => const SuccessScreen());

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
