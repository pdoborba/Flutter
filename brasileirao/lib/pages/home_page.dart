import 'dart:collection';

import 'package:brasileirao/pages/home_controller.dart';
import 'package:brasileirao/pages/team_page.dart';
import 'package:brasileirao/repository/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:brasileirao/widgets/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Brasileirão',
              style: TextStyle(color: (Colors.white))),
        ),
        body: Consumer<TeamsRepository>(builder: (context, repository, child) {
          return ListView.separated(
              itemCount: repository.teams.length,
              itemBuilder: (BuildContext context, int team) {
                final UnmodifiableListView table = repository.teams;
                return ListTile(
                  leading: Logo(
                    image: table[team].logo,
                    width: 40,
                  ),
                  title: Text(table[team].name),
                  subtitle: Text('Títulos ${table[team].title.length}'),
                  trailing: Text(
                    table[team].points.toString(),
                  ),
                  onTap: () {
                    Get.to(
                      () => TeamPage(
                        key: Key(table[team].name),
                        team: table[team],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              padding: const EdgeInsets.all(16));
        }));
  }
}
