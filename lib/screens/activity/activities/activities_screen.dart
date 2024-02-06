import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

import 'activities_body.dart';
import 'cubit/activities_cubit.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ActivitiesCubit>(
        create: (_) => ActivitiesCubit()..init(searchController),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (BuildContext context, ActivitiesState state) {
            switch (state) {
              case ActivitiesLoadingState():
                return const LoadingView();
                
              case ActivitiesLoadedState():
                return ActivitiesBody(state: state);
            }
          },
        ),
      ),
    );
  }
}
