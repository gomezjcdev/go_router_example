import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Menu Screen Page'),
            ElevatedButton(
              onPressed: () =>
                  context.goNamed('details', params: {'id': 2.toString()}),
              child: const Text('Go To Detail'),
            )
          ],
        ),
      ),
    );
  }
}
