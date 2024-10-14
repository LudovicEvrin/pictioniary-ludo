import 'package:flutter/material.dart';
import 'package:pictionairy/main.dart';

class Identification extends StatelessWidget {
  const Identification({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitlePage(
          title: 'PICTION.IA.RY',
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF48A9A6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Entrez votre pseudo',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Entrez votre mot de passe',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('salu');
              },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}