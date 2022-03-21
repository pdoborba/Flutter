import 'package:brasileirao/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import '../repository/team_repository.dart';
import '../pages/home_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(ChangeNotifierProvider(
    create: (context) => TeamsRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brasileirão',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
        dividerColor: Colors.black54,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal[600],
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
