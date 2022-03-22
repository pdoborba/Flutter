import 'package:crypto_invest/pages/moeda_datails.dart';
import 'package:flutter/material.dart';
import 'package:crypto_invest/models/repository/moeda_repository.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final table = MoedaRepository.table;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> select = [];

  appBarDinamic() {
    if (select.isEmpty) {
      return AppBar(
        title: const Center(child: Text('Crypto Invest')),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              select = [];
            });
          },
        ),
        title: Text('${select.length} Selecionados'),
        backgroundColor: Colors.amber[300],
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextTheme(
                headline6: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
            .headline6,
      );
    }
  }

  details(Moeda moeda) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MoedasDetails(moeda: moeda),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamic(),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: (select.contains(table[moeda]))
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      child: Image.asset(table[moeda].icone),
                      width: 40,
                    ),
              title: Text(
                table[moeda].name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(real.format(table[moeda].price)),
              selected: select.contains(table[moeda]),
              selectedColor: Colors.amber,
              onLongPress: () {
                setState(() {
                  (select.contains(table[moeda]))
                      ? select.remove(table[moeda])
                      : select.add(table[moeda]);
                });
              },
              onTap: () => details(table[moeda]),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: table.length,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: select.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.star),
                label: const Text(
                  'Favoritar',
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null);
  }
}
