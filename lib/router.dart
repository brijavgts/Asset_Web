
import 'package:asset_management/locator.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:asset_management/vgts_base_view_model.dart';
import 'package:asset_management/view/change_pwd/change_pwd_page.dart';
import 'package:asset_management/view/forgot_pwd/forgot_pwd_page.dart';
import 'package:asset_management/view/login/login_page.dart';
import 'package:asset_management/view/main/assets/asset_page.dart';
import 'package:asset_management/view/main/employee/employee_page.dart';
import 'package:asset_management/view/main/employee/invite_emp/invite_emp_page.dart';
import 'package:asset_management/view/main/employee/profile_emp/profile_emp_page.dart';
import 'package:asset_management/view/main/main_layout.dart';
import 'package:asset_management/view/main/nav_bar_item.dart';
import 'package:asset_management/view/main/main_layout_viewmodel.dart';
import 'package:asset_management/view/no_network/no_network_page.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:asset_management/view/splash/splash_page.dart';
import 'package:asset_management/view/verification/verification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asset_management/services/shared/api_model/string_extension.dart';
import 'package:go_router/go_router.dart';


class Routes {
  static const String verify_register = "/verify-register";
  static const String no_network = "/no_network";
  static const String login = "/login";
  static const String dashboard = "/main/assets";
  static const String assets = "/main/assets";
  static const String analytics = "/main/analytics";
  static const String employee = "/main/employee";
  static const String register="/register";
  static const String verification="/verification";
  static const String forgot_pwd="/forgot_pwd";
  static const String change_pwd="/change_pwd";
  static const String invite_employee ="/invite_employee";
  static const String profile_employee ="/main/employee/profile";

}

class AppRouter {

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //
  //   var routingData = settings.name?.getRoutingData;
  //
  //   switch (routingData?.route) {
  //
  //    case Routes.splash:
  //     case Routes.verify_register:
  //     return CupertinoPageRoute(
  //       builder: (_) => SplashPage(path: settings.name as String,),
  //        settings: RouteSettings(name: settings.name),
  //      );
  //
  //     case Routes.no_network:
  //        return NoTransitionRoute(
  //          builder: (_) => NoNetWorkPage(),
  //          settings: RouteSettings(name: settings.name),
  //        );
  //
  //     // case Routes.main:
  //     //  // var data = routingData?['mail'];
  //     //   return MaterialPageRoute(
  //     //     builder: (_) => MainPage(),
  //     //     settings: RouteSettings(name: settings.name),
  //     //   );
  //
  //     case Routes.login:
  //       return MaterialPageRoute(
  //         builder: (_)=> LogInPage(),
  //         settings: RouteSettings(name: settings.name),
  //       );
  //
  //   //Register Route and Page
  //     case Routes.register:
  //       return MaterialPageRoute(
  //         builder: (_)=> RegisterPage(),
  //         settings: RouteSettings(name: settings.name ),
  //       );
  //
  //   //Email verification Route and Page
  //     case Routes.verification:
  //       return MaterialPageRoute(
  //         builder:(_)=> VerificationPage(),
  //         settings: RouteSettings(name: settings.name),
  //       );
  //
  //   //Forgot Password Page
  //     case Routes.forgot_pwd:
  //       return MaterialPageRoute(
  //           builder:(_)=>ForgotPwdPage(),
  //           settings: RouteSettings(name: settings.name));
  //
  //   //Change Password Page
  //     case Routes.change_pwd:
  //       return MaterialPageRoute(
  //           builder:(_)=>ChangePwdPage(),
  //           settings: RouteSettings(name: settings.name));
  //
  //     // case Routes.verify_register:
  //     //   var data = routingData?['hashedEmail'];
  //     //   return MaterialPageRoute(
  //     //       builder:(_)=> VerifyRegisterPage(email:data ,),
  //     //       settings: RouteSettings(name: settings.name));
  //
  //     default:
  //
  //       // if (settings.name!.startsWith(Routes.verify_register)) {
  //       //   var data = routingData?['mail'];
  //       //   return MaterialPageRoute(
  //       //       builder:(_)=> VerifyRegisterPage(),
  //       //       settings: RouteSettings(name: settings.name,));
  //       // }
  //           return MaterialPageRoute(
  //               builder: (_) => Scaffold(
  //                 body: Center(
  //                   child: Text('No route defined for ${settings.name}'),
  //                 ),
  //               )
  //           );
  //       }
  //   }

  static GoRouter goRouters = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    navigatorBuilder: (context, state, child) {
      return preferenceService.getAccessToken().isEmpty ? child : MainLayout(child);
    },
    refreshListenable: preferenceService,
    initialLocation: Routes.login,
    routes: <GoRoute>[
        GoRoute(
          path: Routes.login,
          builder: (BuildContext context, GoRouterState state) => LogInPage(),
          redirect: (state){
            final loggedIn  = preferenceService.getAccessToken().isNotEmpty;
            return loggedIn ? "/main/assets" : null;
          },
        ),
        GoRoute(
            path: "/main",
           builder: (BuildContext context, GoRouterState state) {
             Map<String,dynamic> data = <String,dynamic>{};
              data['index'] = 0;
             return AssetPage();
           } ,
            routes: <GoRoute>[
              GoRoute(
                path: "assets" ,
                builder: (BuildContext context, GoRouterState state) {
                  return AssetPage();
                },
              ),
              GoRoute(
                path: "employee" ,
                builder: (BuildContext context, GoRouterState state) {
                  return EmployeePage();
                },
                //
                routes: <GoRoute> [
                  GoRoute(path: "profile",
                    builder: (BuildContext context, GoRouterState state) {
                      return EmployeeProfile();
                    },
                  ),
                ]
              ),
                // GoRoute(//---------
                //   path: "profile",
                //   builder: (BuildContext context, GoRouterState state) {
                //     return EmployeeProfile();
                //   },
                // ),

            ],
          redirect: (state){
            final loggedIn  = preferenceService.getAccessToken().isNotEmpty;
            return loggedIn ? "/main/assets" : "/login";
          },
        ),
        GoRoute(
          path: Routes.register,
          builder: (BuildContext context, GoRouterState state) => RegisterPage(),
          // routes: [
          //     GoRoute(
          //     path: "${Routes.register}/:id",
          //     builder: (BuildContext context, GoRouterState state) => RegisterPage(state.params['id']!),)
          // ]
        ),

        GoRoute(
          path: Routes.verification,
          builder: (BuildContext context, GoRouterState state) {
            return VerificationPage();
          },
          redirect: (state){
            final loggedIn  = preferenceService.getAccessToken().isNotEmpty;
            return loggedIn ? "/main/assets" : null;
          }
        ),

        GoRoute(
        path: Routes.verify_register,
        builder: (BuildContext context, GoRouterState state) {
          final query = state.queryParams['hashedEmail'];
          return SplashPage(hashedEmail:query!,);},
        ),

        GoRoute(
          path: Routes.change_pwd,
          builder: (BuildContext context, GoRouterState state) => ChangePwdPage(),
        ),

        GoRoute(
          path: Routes.forgot_pwd,
          builder: (BuildContext context, GoRouterState state) => ForgotPwdPage(),
        ),

      GoRoute(
        path: Routes.invite_employee,
        builder: (BuildContext context, GoRouterState state)=>EmployeeInvite(),
      )

      ],
  );
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