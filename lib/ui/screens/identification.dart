import 'package:flutter/material.dart';

class Identification extends StatelessWidget {
  const Identification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'test',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('SUUUUUUUUUUUU');
              },
              child: const Text('Enregistrer'),
            ),
          ],
    ),
    ),
    );
  }
}
