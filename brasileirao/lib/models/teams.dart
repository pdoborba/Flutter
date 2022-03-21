import 'package:brasileirao/models/titles.dart';

class Team {
  int? id;
  String name;
  String logo;
  int points;
  late List<Titles> titles = [];

  Team(
      {required this.name,
      required this.logo,
      required this.points,
      id,
      titles});
}
