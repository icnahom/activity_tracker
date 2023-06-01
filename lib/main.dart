import 'package:activity_tracker/shared/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/themes/dark_theme.dart';
import 'shared/themes/light_theme.dart';
import 'store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await Store.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: store.activityController),
        ChangeNotifierProvider.value(value: store.addActivityController),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.dark,
      theme: getLightTheme,
      darkTheme: getDarkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
