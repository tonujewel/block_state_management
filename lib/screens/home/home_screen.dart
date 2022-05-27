import 'package:bloc_state_management/screens/home/bloc/home_bloc.dart';
import 'package:bloc_state_management/services/connectivity_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/boredService.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          RepositoryProvider.of<BoredService>(context),
          RepositoryProvider.of<ConnectivityService>(context))
        ..add(NoInternetEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Flutter bloc")),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (kDebugMode) {
              print("state ----->>> $state");
            }
            if (state is HomeNoInternetState) {
              return const Center(
                child: Text('No internet'),
              );
            }
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeLoadedState) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.activityName),
                    Text(state.activityType),
                    Text(state.participants.toString()),
                    ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context)
                            .add(LoadApiEvent()),
                        child: const Text('Load more'))
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
