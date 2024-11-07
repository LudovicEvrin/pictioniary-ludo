import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pictionairy/api/api_game.dart';
import 'dart:async';
import '../../main.dart';

class Composition extends StatefulWidget {
  final String gameId;

  const Composition({super.key, required this.gameId});

  @override
  _CompositionState createState() => _CompositionState();
}

class _CompositionState extends State<Composition> {
  late Timer _timer;
  Map<String, dynamic>? gameData;
  String? bluePlayer1;
  String? bluePlayer2;
  String? redPlayer1;
  String? redPlayer2;

  @override
  void initState() {
    super.initState();
    _fetchGameData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _fetchGameData();
    });
  }

  Future<void> _fetchGameData() async {
    // Récupère les données de la session de jeu
    gameData = await fetchGameSession(widget.gameId);

    if (gameData != null) {
      // Récupère les noms des joueurs pour chaque équipe
      bluePlayer1 = await _getPlayerName(gameData!['blue_player_1']);
      bluePlayer2 = await _getPlayerName(gameData!['blue_player_2']);
      redPlayer1 = await _getPlayerName(gameData!['red_player_1']);
      redPlayer2 = await _getPlayerName(gameData!['red_player_2']);

      setState(() {}); // Rafraîchit l'interface après avoir récupéré les données
    }
  }

  Future<String?> _getPlayerName(int? playerId) async {
    if (playerId != null) {
      return await fetchPlayerName(playerId);
    }
    return null;
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composition des équipes'),
        backgroundColor: const Color(0xFF48A9A6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Numéro de la Partie : ${widget.gameId}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
                child: QrImageView(
              data: widget.gameId,
              version: QrVersions.auto,
              size: 200.0,
            ),
            ),

            const TeamTitle(teamName: 'Equipe Bleu'),
            const SizedBox(height: 8),
            TeamCard(
              backgroundColor: Colors.blue,
              players: [
                bluePlayer1 ?? '<en attente>',
                bluePlayer2 ?? '<en attente>',
              ],
            ),
            const SizedBox(height: 24),
            const TeamTitle(teamName: 'Equipe Rouge'),
            const SizedBox(height: 8),
            TeamCard(
              backgroundColor: Colors.red,
              players: [
                redPlayer1 ?? '<en attente>',
                redPlayer2 ?? '<en attente>',
              ],
            ),
            const Spacer(),
            const Text(
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