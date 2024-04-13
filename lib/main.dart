import 'package:cinesmaracaibo/firebase_options.dart';
import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/routes.dart';
import 'package:cinesmaracaibo/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineVE',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      navigatorKey: navigatorKey,
      initialRoute: Auth.routeName,
      routes: routes,
    );
  }
}
