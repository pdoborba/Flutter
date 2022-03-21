import 'dart:collection';

import 'package:brasileirao/controllers/theme_controller.dart';
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
  var controller = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Brasileirão'),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: Obx(() => controller.isDark.value
                        ? const Icon(Icons.brightness_7)
                        : const Icon(Icons.brightness_2)),
                    title: Obx(() => controller.isDark.value
                        ? const Text('Tema Claro')
                        : const Text('Tema Escuro')),
                    onTap: () => controller.changeTheme(),
                  ),
                )
              ],
            )
          ],
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
                  subtitle: Text('Títulos ${table[team].titles.length}'),
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
