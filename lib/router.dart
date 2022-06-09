
import 'package:asset_management/view/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const String initialRoute = "login";

class Routes {
  static const String splash = "/";
  static const String dashboard = "/dashboard";
  static const String no_network = "/no_network";
  static const String login = "/login";
  static const String main = "/main";




}

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
    //
    // case Routes.splash:
    //   return CupertinoPageRoute(
    //     builder: (_) => SplashPage(),
    //     settings: RouteSettings(name: settings.name),
    //   );
    //
    //   case Routes.no_network:
    //     return NoTransitionRoute(
    //       builder: (_) => NoNetWorkPage(),
    //       settings: RouteSettings(name: settings.name),
    //     );
    //
      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => MainPage(),
          settings: RouteSettings(name: settings.name),
        );

      default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                )
            );
        }
    }

  }



/// NoTransitionRoute
/// Custom route which has no transitions
class NoTransitionRoute<T> extends MaterialPageRoute<T> {
  NoTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

/// NoPushTransitionRoute
/// Custom route which has no transition when pushed, but has a pop animation
class NoPushTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPushTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is popping
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

/// NoPopTransitionRoute
/// Custom route which has no transition when popped, but has a push animation
class NoPopTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPopTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is pushing
    if (animation.status == AnimationStatus.forward) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

class RouteUtils {
  static RoutePredicate withNameLike(String name) {
    return (Route<dynamic> route) {
      return !route.willHandlePopInternally &&
          route is ModalRoute &&
          route.settings.name != null &&
          route.settings.name?.contains(name) == true;
    };
  }
}