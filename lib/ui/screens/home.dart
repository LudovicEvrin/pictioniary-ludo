import 'package:flutter/material.dart';
import 'package:pictionairy/api/api_login.dart';
import 'package:pictionairy/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            // Ajout de la Row avec le texte 'Bienvenue'
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FutureBuilder<String?>(
              future: getName(),  // Appel de la méthode asynchrone
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Affiche un indicateur de chargement
                } else if (snapshot.hasError) {
                  return const Text('Erreur de récupération du nom');
                } else if (snapshot.hasData && snapshot.data != null) {
                  return Text(
                    'Bienvenue, ${snapshot.data}', // Affichage du nom récupéré
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                } else {
                  return const Text(
                    'Bienvenue',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  }
                }
              ),
            ),
            const SizedBox(height: 60), // Espacement
            // Premier bouton "Nouvelle partie"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Nouvelle partie');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16), // Contrôle du padding
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, // Adapte la taille du bouton au contenu
                  children: <Widget>[
                    Text('Nouvelle partie'),
                  ],
                ),
              ),
            ),
            // Deuxième bouton "Rejoindre une partie" avec image
            ElevatedButton(
              onPressed: () {
                debugPrint('Rejoindre une partie');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Contrôle du padding
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Adapte la taille du bouton au contenu
                children: <Widget>[
                  Image.asset(
                    'assets/images/QR_icon.png', // Chemin vers ton image PNG
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10), // Espacement entre l'image et le texte
                  const Text('Rejoindre une partie'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
