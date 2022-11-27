import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:bloc_state_management/services/authenticationService.dart';
import 'package:bloc_state_management/services/connectivity_service.dart';
import 'package:bloc_state_management/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'screens/welcome/welcome_screen.dart';
import 'services/image_gallery_service.dart';

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
        RepositoryProvider(create: (context) => ConnectivityService()),
        RepositoryProvider(create: (context) => ApiProvider()),
        RepositoryProvider(create: (context) => ImageService()),
    
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WelcomeScreen()),
    );
  }
}
