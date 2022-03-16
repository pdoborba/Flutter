import 'package:flutter/material.dart';
import 'package:brasileirao/models/titles.dart';

class Team {
  String name;
  String logo;
  int points;
  Color color;
  List<Titles> title = [];

  Team({
    required this.name,
    required this.logo,
    required this.points,
    required this.color,
  });
}
