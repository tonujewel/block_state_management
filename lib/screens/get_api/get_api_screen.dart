import 'package:bloc_state_management/models/covid_dm.dart';
import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/custom_progress.dart';
import '../../widget/no_internet_widget.dart';
import 'bloc/getapi_bloc.dart';

class GetApiScreen extends StatelessWidget  {
  const GetApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdfe6e9),
      appBar: AppBar(title: const Text("Get Api Example")),
    
      body: BlocProvider(
        create: (context) => GetApiBloc(
          // RepositoryProvider.of<ConnectivityService>(context),
          RepositoryProvider.of<ApiProvider>(context),
        )..add(LoadGetApiEvent()),
        child: BlocBuilder<GetApiBloc, GetApiState>(
          builder: (context, state) {
            if (state is GetApiNoInternetState) {
              return const NoInternetWidget();
            }

            if (state is GetapiLoadingState) {
              return const CustomProgress();
            }

            if (state is GetapiLoadedState) {
              return GetApiBody(
                covidDm: state.covidDm,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class GetApiBody extends StatelessWidget {
  final CovidDm covidDm;
  const GetApiBody({
    Key? key,
    required this.covidDm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GetApiItemContainer(
              title: 'Global',
              newConfirm: "${covidDm.global!.newConfirmed}",
              totalConfirm: "${covidDm.global!.totalConfirmed}",
              newDeath: "${covidDm.global!.newDeaths}",
              totalDeath: "${covidDm.global!.totalDeaths}",
              date: "${covidDm.global!.date}",
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: covidDm.countries!.length,
                itemBuilder: (context, index) {
                  return GetApiItemContainer(
                    title: '${covidDm.countries![index].country}',
                    newConfirm: "${covidDm.countries![index].newConfirmed}",
                    totalConfirm: "${covidDm.countries![index].totalConfirmed}",
                    newDeath: "${covidDm.countries![index].newDeaths}",
                    totalDeath: "${covidDm.countries![index].totalDeaths}",
                    date: "${covidDm.countries![index].date}",
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class GetApiItemContainer extends StatelessWidget {
  const GetApiItemContainer({
    Key? key,
    required this.newConfirm,
    required this.totalConfirm,
    required this.newDeath,
    required this.totalDeath,
    required this.date,
    required this.title,
  }) : super(key: key);

  final String newConfirm, totalConfirm, newDeath, totalDeath, date, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("New Confirms: $newConfirm"),
          const SizedBox(height: 10),
          Text("Total Confirms: $totalConfirm"),
          const SizedBox(height: 10),
          Text("New Deaths: $newDeath"),
          const SizedBox(height: 10),
          Text("Total Deaths Confirm: $totalDeath"),
          const SizedBox(height: 10),
          Text("Date: $date"),
        ],
      ),
    );
  }
}
