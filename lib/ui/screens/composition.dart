import 'package:flutter/material.dart';

import '../../main.dart';

class Composition extends StatelessWidget {
  const Composition({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Composition des équipes'),
           leading: const Icon(Icons.arrow_back),
           backgroundColor: const Color(0xFF48A9A6),
    ),
       body: const Padding(
         padding: EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TeamTitle(teamName: 'Equipe Bleu'),
             SizedBox(height: 8),
             TeamCard(
               backgroundColor: Colors.blue,
               players: ['Matteo(vous)', '<en attente>'],
             ),
             SizedBox(height: 24),
             TeamTitle(teamName: 'Equipe Rouge'),
             SizedBox(height: 8),
             TeamCard(
               backgroundColor: Colors.red,
               players: ['<en attente>', '<en attente>'],
             ),
             Spacer(),
             Text(
               'La partie sera lancée automatiquement une fois les joueurs au complet',
               style: TextStyle(fontSize: 16),
               textAlign: TextAlign.center,
             ),
           ],
         ),
       ),
     );
  }
}
