import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen Page'),
            ElevatedButton(
              onPressed: () {
                LoginInfo.isLoggedIn = true;
                context.goNamed('home');
                // this can be removed if we implement notifyListener in the class
                // and assign them to GoRouter Constructor in the refreshListenable param.
              },
              child: const Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }
}
