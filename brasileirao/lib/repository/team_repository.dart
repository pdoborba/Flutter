import 'dart:collection';

import 'package:brasileirao/database/db.dart';
import 'package:flutter/material.dart';
import 'package:brasileirao/models/teams.dart';
import 'package:brasileirao/models/titles.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];

  UnmodifiableListView get teams => UnmodifiableListView(_teams);

  void addTitle({required Team team, required Titles title}) async {
    var db = await DB.get();

    int id = await db.insert('titles', {
      'championship': title.championship,
      'year': title.year,
      'team_id': team.id
    });
    title.id = id;
    team.titles.add(title);
    notifyListeners();
  }

  void editTitle(
      {required Titles title,
      required String year,
      required String championship}) async {
    var db = await DB.get();
    await db.update(
        'titles',
        {
          'championship': title.championship,
          'year': title.year,
        },
        where: 'id = ?',
        whereArgs: [title.id]);

    title.championship = championship;
    title.year = year;
    notifyListeners();
  }

  static setupTeams() {
    return [
      Team(
        name: 'Flamengo',
        points: 71,
        logo: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
      ),
      Team(
        name: 'Internacional',
        points: 69,
        logo:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        logo:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        logo: 'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        logo:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        logo: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        logo: 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
      ),
      Team(
        name: 'Santos',
        points: 54,
        logo: 'https://logodetimes.com/times/santos/logo-santos-256.png',
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        logo:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
      ),
      Team(
        name: 'Corinthians',
        points: 50,
        logo:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        logo:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
      ),
      Team(
        name: 'Ceará',
        points: 49,
        logo: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        logo:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
      ),
      Team(
        name: 'Sport',
        points: 42,
        logo:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
      ),
      Team(
        name: 'Bahia',
        points: 41,
        logo: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        logo: 'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
      ),
      Team(
        name: 'Vasco',
        points: 38,
        logo:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
      ),
      Team(
        name: 'Goiás',
        points: 37,
        logo: 'https://logodetimes.com/times/goias/logo-goias-novo-256.png',
      ),
      Team(
        name: 'Coritiba',
        points: 31,
        logo: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        logo: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
      ),
    ];
  }

  TeamsRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List teams = await db.query('teams');

    for (var team in teams) {
      _teams.add(
        Team(
            id: team['id'],
            name: team['name'],
            logo: team['logo'],
            points: team['points'],
            titles: await getTitles(team['id'])),
      );
      notifyListeners();
    }
  }

  getTitles(teamId) async {
    print(teamId);
    var db = await DB.get();
    var results =
        await db.query('titles', where: 'team_id = ?', whereArgs: [teamId]);
    List<Titles> titles = [];
    for (var title in results) {
      titles.add(Titles(
          id: title['id'],
          championship: title['campeonato'],
          year: title['year']));
    }
    return titles;
  }
}
