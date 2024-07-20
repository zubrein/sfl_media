import 'package:flutter/material.dart';

import 'core/di/dependency_initializer.dart';
import 'core/logger.dart';
import 'features/home/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Log.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SFL MEDIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
