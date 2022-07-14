

import 'package:asset_management/locator.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:asset_management/view/login/login_page.dart';
import 'package:asset_management/view/main/assets/asset_page.dart';
import 'package:asset_management/view/main/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';

Future<Null> main() async {

  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

    runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));


    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder:(BuildContext context,_)=> MaterialApp.router(
        title: "",
        theme: AppStyle.appTheme,
        routeInformationProvider: AppRouter.goRouters.routeInformationProvider,
        routeInformationParser: AppRouter.goRouters.routeInformationParser,
        routerDelegate: AppRouter.goRouters.routerDelegate,
        builder: _setupDialogManager,
        //initialRoute:Routes.splash,
        debugShowCheckedModeBanner: false,
        //  onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      ),
    );
  }

  Widget _setupDialogManager(context, widget) {
    return ResponsiveWrapper.builder(
      Navigator(
        initialRoute: "/",
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        final MediaQueryData data = MediaQuery.of(context);
        return DialogManager(
          child: MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: widget,
          ),
        );
      }),
    ),
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(480,name: MOBILE),
        ResponsiveBreakpoint(breakpoint: 550,name:"K"),
        ResponsiveBreakpoint(breakpoint: 700,name:"2K"),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ResponsiveBreakpoint.resize(1200,name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/foundation.dart';
//
// void main() => runApp(App());
//
// /// The main app.
// class App extends StatelessWidget {
//   /// Creates an [App].
//   App({Key? key}) : super(key: key);
//
//   /// The title of the app.
//   static const String title = 'GoRouter Example: Nested Navigation';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp.router(
//     routeInformationProvider: _router.routeInformationProvider,
//     routeInformationParser: _router.routeInformationParser,
//     routerDelegate: _router.routerDelegate,
//     title: title,
//   );
//
//   late final GoRouter _router = GoRouter(
//     routes: <GoRoute>[
//       GoRoute(
//         path: '/',
//         redirect: (_) => '/family/${Families.data[0].id}',
//       ),
//       GoRoute(
//         path: '/family/:fid',
//         builder: (BuildContext context, GoRouterState state) =>
//             FamilyTabsScreen(
//               key: state.pageKey,
//               selectedFamily: Families.family(state.params['fid']!),
//             ),
//         routes: <GoRoute>[
//           GoRoute(
//             path: 'person/:pid',
//             builder: (BuildContext context, GoRouterState state) {
//               final Family family = Families.family(state.params['fid']!);
//               final Person person = family.person(state.params['pid']!);
//
//               return PersonScreen(family: family, person: person);
//             },
//           ),
//         ],
//       ),
//     ],
//
//     // show the current router location as the user navigates page to page; note
//     // that this is not required for nested navigation but it is useful to show
//     // the location as it changes
//     navigatorBuilder:
//         (BuildContext context, GoRouterState state, Widget child) => Material(
//       child: Column(
//         children: <Widget>[
//           Expanded(child: child),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Text(state.location),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// /// The family tabs screen.
// class FamilyTabsScreen extends StatefulWidget {
//   /// Creates a [FamilyTabsScreen].
//   FamilyTabsScreen({required Family selectedFamily, Key? key})
//       : index =
//   Families.data.indexWhere((Family f) => f.id == selectedFamily.id),
//         super(key: key) {
//     assert(index != -1);
//   }
//
//   /// The tab index.
//   final int index;
//
//   @override
//   _FamilyTabsScreenState createState() => _FamilyTabsScreenState();
// }
//
// class _FamilyTabsScreenState extends State<FamilyTabsScreen>
//     with TickerProviderStateMixin {
//   late final TabController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(
//       length: Families.data.length,
//       vsync: this,
//       initialIndex: widget.index,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(FamilyTabsScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _controller.index = widget.index;
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text(App.title),
//       bottom: TabBar(
//         controller: _controller,
//         tabs: <Tab>[
//           for (final Family f in Families.data) Tab(text: f.name)
//         ],
//         onTap: (int index) => _tap(context, index),
//       ),
//     ),
//     body: TabBarView(
//       controller: _controller,
//       children: <Widget>[
//         for (final Family f in Families.data) FamilyView(family: f)
//       ],
//     ),
//   );
//
//   void _tap(BuildContext context, int index) =>
//       context.go('/family/${Families.data[index].id}');
// }
//
// /// The family view.
// class FamilyView extends StatefulWidget {
//   /// Creates a [FamilyView].
//   const FamilyView({required this.family, Key? key}) : super(key: key);
//
//   /// The family to display.
//   final Family family;
//
//   @override
//   State<FamilyView> createState() => _FamilyViewState();
// }
//
// /// Use the [AutomaticKeepAliveClientMixin] to keep the state, like scroll
// /// position and text fields when switching tabs, as well as when popping back
// /// from sub screens. To use the mixin override [wantKeepAlive] and call
// /// `super.build(context)` in build.
// ///
// /// In this example if you make a web build and make the browser window so low
// /// that you have to scroll to see the last person on each family tab, you will
// /// see that state is kept when you switch tabs and when you open a person
// /// screen and pop back to the family.
// class _FamilyViewState extends State<FamilyView>
//     with AutomaticKeepAliveClientMixin {
//   // Override `wantKeepAlive` when using `AutomaticKeepAliveClientMixin`.
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext context) {
//     // Call `super.build` when using `AutomaticKeepAliveClientMixin`.
//     super.build(context);
//     return ListView(
//       children: <Widget>[
//         for (final Person p in widget.family.people)
//           ListTile(
//             title: Text(p.name),
//             onTap: () =>
//                 context.go('/family/${widget.family.id}/person/${p.id}'),
//           ),
//       ],
//     );
//   }
// }
//
// /// The person screen.
// class PersonScreen extends StatelessWidget {
//   /// Creates a [PersonScreen].
//   const PersonScreen({required this.family, required this.person, Key? key})
//       : super(key: key);
//
//   /// The family this person belong to.
//   final Family family;
//
//   /// The person to be displayed.
//   final Person person;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: Text(person.name)),
//     body: Text('${person.name} ${family.name} is ${person.age} years old'),
//   );
// }
//
//
//
//
// /// Person data class.
// class Person {
//   /// Creates a [Person].
//   Person({required this.id, required this.name, required this.age});
//
//   /// The id of the person.
//   final String id;
//
//   /// The name of the person.
//   final String name;
//
//   /// The age of the person.
//   final int age;
// }
//
// /// Family data class.
// class Family {
//   /// Creates a [Family].
//   Family({required this.id, required this.name, required this.people});
//
//   /// The id of the family.
//   final String id;
//
//   /// The name of the family.
//   final String name;
//
//   /// The list of [Person]s in the family.
//   final List<Person> people;
//
//   /// Gets the [Person] with the given id in this family.
//   Person person(String pid) => people.singleWhere(
//         (Person p) => p.id == pid,
//     orElse: () => throw Exception('unknown person $pid for family $id'),
//   );
// }
//
// /// The mock of families data.
// class Families {
//   Families._();
//
//   /// The data.
//   static final List<Family> data = <Family>[
//     Family(
//       id: 'f1',
//       name: 'Sells',
//       people: <Person>[
//         Person(id: 'p1', name: 'Chris', age: 52),
//         Person(id: 'p2', name: 'John', age: 27),
//         Person(id: 'p3', name: 'Tom', age: 26),
//       ],
//     ),
//     Family(
//       id: 'f2',
//       name: 'Addams',
//       people: <Person>[
//         Person(id: 'p1', name: 'Gomez', age: 55),
//         Person(id: 'p2', name: 'Morticia', age: 50),
//         Person(id: 'p3', name: 'Pugsley', age: 10),
//         Person(id: 'p4', name: 'Wednesday', age: 17),
//       ],
//     ),
//     Family(
//       id: 'f3',
//       name: 'Hunting',
//       people: <Person>[
//         Person(id: 'p1', name: 'Mom', age: 54),
//         Person(id: 'p2', name: 'Dad', age: 55),
//         Person(id: 'p3', name: 'Will', age: 20),
//         Person(id: 'p4', name: 'Marky', age: 21),
//         Person(id: 'p5', name: 'Ricky', age: 22),
//         Person(id: 'p6', name: 'Danny', age: 23),
//         Person(id: 'p7', name: 'Terry', age: 24),
//         Person(id: 'p8', name: 'Mikey', age: 25),
//         Person(id: 'p9', name: 'Davey', age: 26),
//         Person(id: 'p10', name: 'Timmy', age: 27),
//         Person(id: 'p11', name: 'Tommy', age: 28),
//         Person(id: 'p12', name: 'Joey', age: 29),
//         Person(id: 'p13', name: 'Robby', age: 30),
//         Person(id: 'p14', name: 'Johnny', age: 31),
//         Person(id: 'p15', name: 'Brian', age: 32),
//       ],
//     ),
//   ];
//
//   /// Looks up a family in the data.
//   static Family family(String fid) => data.family(fid);
// }
//
// extension on List<Family> {
//   Family family(String fid) => singleWhere(
//         (Family f) => f.id == fid,
//     orElse: () => throw Exception('unknown family $fid'),
//   );
// }
//
// /// The login information.
// class LoginInfo extends ChangeNotifier {
//   /// The username of login.
//   String get userName => _userName;
//   String _userName = '';
//
//   /// Whether a user has logged in.
//   bool get loggedIn => _userName.isNotEmpty;
//
//   /// Logs in a user.
//   void login(String userName) {
//     _userName = userName;
//     notifyListeners();
//   }
//
//   /// Logs out the current user.
//   void logout() {
//     _userName = '';
//     notifyListeners();
//   }
// }
//
// /// The login information.
// class LoginInfo2 extends ChangeNotifier {
//   /// The username of login.
//   String get userName => _userName;
//   String _userName = '';
//
//   /// Whether a user has logged in.
//   bool get loggedIn => _userName.isNotEmpty;
//
//   /// Logs in a user.
//   Future<void> login(String userName) async {
//     _userName = userName;
//     notifyListeners();
//     await Future<void>.delayed(const Duration(microseconds: 2500));
//   }
//
//   /// Logs out the current user.
//   Future<void> logout() async {
//     _userName = '';
//     notifyListeners();
//     await Future<void>.delayed(const Duration(microseconds: 2500));
//   }
// }
//
// /// The relation of a person in a family.
// class FamilyPerson {
//   /// Creates a [FamilyPerson].
//   FamilyPerson({required this.family, required this.person});
//
//   /// The family.
//   final Family family;
//
//   /// the person.
//   final Person person;
// }
//
// /// The repository.
// class Repository {
//   /// A random number generator.
//   static final Random rnd = Random();
//
//   /// Gets the families data.
//   Future<List<Family>> getFamilies() async {
//     // simulate network delay
//     await Future<void>.delayed(const Duration(seconds: 1));
//
//     // simulate error
//     // if (rnd.nextBool()) throw Exception('error fetching families');
//
//     // return data "fetched over the network"
//     return Families.data;
//   }
//
//   /// Gets a family from the repository.
//   Future<Family> getFamily(String fid) async =>
//       (await getFamilies()).family(fid);
//
//   /// Gets a person from the repository.
//   Future<FamilyPerson> getPerson(String fid, String pid) async {
//     final Family family = await getFamily(fid);
//     return FamilyPerson(family: family, person: family.person(pid));
//   }
// }
//
// /// The repository.
// class Repository2 {
//   Repository2._(this.userName);
//
//   /// The username.
//   final String userName;
//
//   /// Gets a repository with the username.
//   static Future<Repository2> get(String userName) async {
//     // simulate network delay
//     await Future<void>.delayed(const Duration(seconds: 1));
//     return Repository2._(userName);
//   }
//
//   /// A random number generator.
//   static final Random rnd = Random();
//
//   /// Gets the families data.
//   Future<List<Family>> getFamilies() async {
//     // simulate network delay
//     await Future<void>.delayed(const Duration(seconds: 1));
//
//     // simulate error
//     // if (rnd.nextBool()) throw Exception('error fetching families');
//
//     // return data "fetched over the network"
//     return Families.data;
//   }
//
//   /// Gets a family from the repository.
//   Future<Family> getFamily(String fid) async =>
//       (await getFamilies()).family(fid);
//
//   /// Gets a person from the repository.
//   Future<FamilyPerson> getPerson(String fid, String pid) async {
//     final Family family = await getFamily(fid);
//     return FamilyPerson(family: family, person: family.person(pid));
//   }
// }
//
// /// A state stream.
// abstract class StateStream<T> {
//   /// Creates a [StateStream].
//   StateStream();
//
//   /// Creates a [StateStream] with an initial value.
//   StateStream.seeded(T value) : state = value {
//     _controller.add(value);
//   }
//
//   final StreamController<T> _controller = StreamController<T>();
//
//   /// The state.
//   late T state;
//
//   /// The [Stream] object.
//   Stream<T> get stream => _controller.stream;
//
//   /// Pipes a new state into the stream.
//   void emit(T state) {
//     this.state = state;
//     _controller.add(state);
//   }
//
//   /// Disposes the stream.
//   void dispose() {
//     _controller.close();
//   }
// }
//
// /// Stream for whether the user is currently logged in.
// class LoggedInState extends StateStream<bool> {
//   /// Creates a [LoggedInState].
//   LoggedInState();
//
//   /// Creates a [LoggedInState] with an initial value.
//   LoggedInState.seeded(bool value) : super.seeded(value);
// }