import 'package:fit_counter/presentation/views/count_view.dart';
import 'package:fit_counter/presentation/views/history_view.dart';
import 'package:fit_counter/presentation/views/set_name_view.dart';
import 'package:fit_counter/presentation/views/settings_view.dart';
import 'package:fit_counter/presentation/views/start_view.dart';
import 'package:fit_counter/presentation/views/stop_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/welcome_view.dart';

class Routes{
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const StartView());
      case '/setName':
        return _createAnimatedRouteRight(const SetNameView());
      case '/welcome':
        return _createAnimatedRouteRight(const WelcomeView());
      case '/settings':
        return _materialRoute(const SettingsView());
      case '/history':
        return _materialRoute(const HistoryView());
      case '/start':
        return _materialRoute(const CountView());
      case '/stop':
        return _materialRoute(const StopView());
      default:
        return null;
    }
  }
  static Route? onGenerateRoutesLogged(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const StartView());
      case '/setName':
        return _createAnimatedRouteRight(const SetNameView());
      case '/welcome':
        return _createAnimatedRouteRight(const WelcomeView());
      case '/settings':
        return _materialRoute(const SettingsView());
      case '/history':
        return _materialRoute(const HistoryView());
      case '/start':
        return _materialRoute(const CountView());
      case '/stop':
        return _materialRoute(const StopView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _createAnimatedRouteRight(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0);
        const end = Offset(0, 0);
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }


  static Route<dynamic> _createAnimatedRouteDown(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset(0, 0);
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

}