import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:bloc_state_management/utils/app_constant.dart';
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
        child: BlocBuilder<PostRequestBloc, PostRequestState>(
          builder: (context, state) {
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
          },
        ),
      ),
    );
  }
}
