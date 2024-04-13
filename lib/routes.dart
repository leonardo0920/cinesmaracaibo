import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/screen/home/home_page.dart';
import 'package:cinesmaracaibo/screen/login/login_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Auth.routeName: (context) => const Auth(),
  HomePage.routeName: (context) => const HomePage(),
  LoginPage.routeName: (context) => const LoginPage(),
};
