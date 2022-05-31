import 'package:bloc_state_management/screens/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_state_management/screens/todo/todo_screen.dart';
import 'package:bloc_state_management/services/authenticationService.dart';
import 'package:bloc_state_management/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwrodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationBloc(
          RepositoryProvider.of<AuthenticationService>(context),
          RepositoryProvider.of<TodoService>(context),
        )..add(RegisterServiceEvents()),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SuccessfullLoginState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodoScreen(username: state.username),
                ),
              );
            }

            if (state is AuthenticationInitial) {
              if (state.error != null) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Error"),
                          content: Text(state.error!),
                        ));
              }
            }
          },
          builder: (context, state) {
            if (state is AuthenticationInitial) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: "Username"),
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwrodController,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                LoginEvent(usernameController.text,
                                    passwrodController.text));
                          },
                          child: const Text('LOGIN')),
                      const SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                RegisterAccountEvent(usernameController.text,
                                    passwrodController.text));
                          },
                          child: const Text('REGISTER')),
                    ],
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
