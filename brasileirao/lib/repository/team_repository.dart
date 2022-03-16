import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:brasileirao/models/teams.dart';
import 'package:brasileirao/models/titles.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];

  UnmodifiableListView get teams => UnmodifiableListView(_teams);

  void addTitle({required Team team, required Titles title}) {
    team.title.add(title);

    notifyListeners();
  }

  void editTitle(
      {required Titles title,
      required String year,
      required String championship}) {
    title.championship = championship;
    title.year = year;
    notifyListeners();
  }

  TeamsRepository() {
    _teams.addAll([
      Team(
        name: 'Flamengo',
        points: 71,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        color: Colors.red,
      ),
      Team(
        name: 'Internacional',
        points: 69,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
        color: Colors.red,
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
        color: Colors.grey,
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
        color: Colors.red,
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
        color: Colors.teal,
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/gremio.png',
        color: Colors.blue,
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
        color: Colors.green,
      ),
      Team(
        name: 'Santos',
        points: 54,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
        color: Colors.grey,
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
        color: Colors.red,
      ),
      Team(
        name: 'corinthians',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
        color: Colors.grey,
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        logo:
            'https://e.imguol.com/futebol/brasoes/40x40/red-bull-bragantino.png',
        color: Colors.grey,
      ),
      Team(
        name: 'Ceará',
        points: 49,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
        color: Colors.grey,
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-go.png',
        color: Colors.red,
      ),
      Team(
        name: 'Sport',
        points: 42,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
        color: Colors.red,
      ),
      Team(
        name: 'Bahia',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png',
        color: Colors.blue,
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fortaleza.png',
        color: Colors.red,
      ),
      Team(
        name: 'Vasco',
        points: 38,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
        color: Colors.grey,
      ),
      Team(
        name: 'Goiás',
        points: 37,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
        color: Colors.green,
      ),
      Team(
        name: 'coloritiba',
        points: 31,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
        color: Colors.green,
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
        color: Colors.grey,
      ),
    ]);
  }
}
