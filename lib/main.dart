import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/pages/detail_screen.dart';
import 'package:go_router_example/pages/home_screen.dart';
import 'package:go_router_example/pages/login_screen.dart';
import 'package:go_router_example/pages/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class LoginInfo {
  static bool isLoggedIn = false;
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }

  final _router = GoRouter(
    redirect: (GoRouterState state) {
      final loggedIn = LoginInfo.isLoggedIn;
      final isLogging = state.location == '/login';
      if (!loggedIn && !isLogging) return '/login';
      if (loggedIn && isLogging) return '/';
      return null;
    },
    initialLocation: '/login',
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        name: 'menu',
        path: '/menu',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: MenuScreen(),
        ),
        routes: [
          GoRoute(
            name: 'details',
            path: ':id',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: DetailScreen(id: int.parse(state.params['id']!)),
            ),
          )
        ],
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: LoginScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Go Router'),
          ),
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );
}
