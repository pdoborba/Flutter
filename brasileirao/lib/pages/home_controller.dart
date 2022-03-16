import 'dart:collection';

import 'package:brasileirao/repository/team_repository.dart';

class HomeController {
  late TeamsRepository teamsRepository;
  UnmodifiableListView get table => teamsRepository.teams;

  HomeController() {
    teamsRepository = TeamsRepository();
  }
}
