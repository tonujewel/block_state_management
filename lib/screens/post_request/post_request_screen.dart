import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:bloc_state_management/screens/profile/profile_screen.dart';
import 'package:bloc_state_management/utils/app_constant.dart';
import 'package:bloc_state_management/widget/custom_progress.dart';
import 'package:bloc_state_management/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_request_bloc.dart';

class PostRequestScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post request"),
      ),
      body: BlocProvider(
        create: (context) =>
            PostRequestBloc(RepositoryProvider.of<ApiProvider>(context)),
        child: BlocConsumer<PostRequestBloc, PostRequestState>(
          listener: (context, state) {
            print("state $state");
            if (state is PostRequestLoginFailedState) {
              AppConstant.snackBar(state.message, context);
            }
            if (state is PostRequestLoginSuccessState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(signInDm: state.signInDm)));
            }
          },
          builder: (context, state) {
            if (state is PostRequestLoadingState) {
              return CustomProgress(
                child: BodyWidget(
                    emailController: emailController,
                    passwordController: passwordController),
              );
            }

            return BodyWidget(
                emailController: emailController,
                passwordController: passwordController);
          },
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        CustomTextField(
          hint: "Email",
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hint: "Password",
          controller: passwordController,
          obscure: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (emailController.text.isEmpty) {
              AppConstant.snackBar("Email required", context);
              return;
            }

            if (passwordController.text.isEmpty) {
              AppConstant.snackBar("Password required", context);
              return;
            }

            BlocProvider.of<PostRequestBloc>(context).add(
              PostRequestLoginApiCallEvent(
                emailController.text,
                passwordController.text,
              ),
            );
          },
          child: const Text("Login"),
        )
      ],
    );
  }
}
