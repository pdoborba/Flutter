import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../repository/team_repository.dart';
import '../models/teams.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'dadosTeams.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(teams);
        await db.execute(titles);
        await setupTeams(db);
      },
    );
  }

  setupTeams(db) async {
    for (Team team in TeamsRepository.setupTeams()) {
      await db.insert('teams', {
        'name': team.name,
        'logo': team.logo,
        'points': team.points,
      });
    }
  }

  String get teams => ''' 
  CREATE TABLE teams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    points INTEGER,
    logo TEXT
    );
    ''';

  String get titles => ''' 
  CREATE TABLE titles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    championship TEXT,
    year Text,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
    );
    ''';
}
