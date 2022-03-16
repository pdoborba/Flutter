import 'package:brasileirao/pages/edit_title_page.dart';
import 'package:brasileirao/repository/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/teams.dart';
import '../widgets/logo.dart';
import 'add_title_page.dart';

class TeamPage extends StatefulWidget {
  late Team team;

  TeamPage({Key? key, required this.team}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  titlePage() {
    Get.to(() => AddTitlePage(team: widget.team));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.team.color,
          title: Text(widget.team.name,
              style: const TextStyle(color: (Colors.white))),
          actions: [
            IconButton(icon: const Icon(Icons.add), onPressed: titlePage)
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatisticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Logo(
                  image: widget.team.logo,
                  width: 200,
                ),
              ),
              Text(
                'Pontos: ${widget.team.points}',
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
          title()
        ]),
      ),
    );
  }

  Widget title() {
    final team = Provider.of<TeamsRepository>(context)
        .teams
        .firstWhere((t) => t.name == widget.team.name);

    final quantity = team.title.length;

    return quantity == 0
        ? Container(
            child: const Center(
              child: Text(
                'Esse time não tem títulos! :(',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(team.title[index].championship),
                trailing: Text(team.title[index].year),
                onTap: () {
                  Get.to(EditTitlePage(titles: team.title[index]),
                      fullscreenDialog: true);
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantity,
          );
  }
}
