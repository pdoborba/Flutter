import 'package:brasileirao/repository/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../models/titles.dart';

// ignore: must_be_immutable
class EditTitlePage extends StatefulWidget {
  EditTitlePage({Key? key, required this.titles}) : super(key: key);

  late Titles titles;

  @override
  State<EditTitlePage> createState() => _EditTitlePageState();
}

class _EditTitlePageState extends State<EditTitlePage> {
  final _championship = TextEditingController();
  final _year = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _year.text = widget.titles.year;
    _championship.text = widget.titles.championship;
  }

  edit() {
    Provider.of<TeamsRepository>(context, listen: false).editTitle(
      title: widget.titles,
      championship: _championship.text,
      year: _year.text,
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Titulo'),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(onPressed: edit, icon: const Icon(Icons.check))],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _year,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o ano do título';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _championship,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o campeonato';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
