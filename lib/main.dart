import 'package:bloc_state_management/screens/authentication/login/login_screen.dart';
import 'package:bloc_state_management/services/authenticationService.dart';
import 'package:bloc_state_management/services/connectivity_service.dart';
import 'package:bloc_state_management/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'services/boredService.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => TodoService()),
        RepositoryProvider(create: (context) => AuthenticationService()),
        RepositoryProvider(create: (context) => BoredService()),
        RepositoryProvider(create: (context) => ConnectivityService()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen()),
    );
  }
}
